import Foundation
import CSDL2
import CSDL2Vulkan
import CVulkan
import Vulkan

// SPRIV Compiler? https://github.com/stuartcarnie/SwiftSPIRV-Cross

@propertyWrapper
public class Deferred<T> {
  var value: T? = nil
  public var wrappedValue: T {
    get { value! }
    set { value = newValue }
  }

  public init() {}
}

public class VulkanApplication {
  @Deferred var window: OpaquePointer
  @Deferred var instance: Instance
  @Deferred var surface: SurfaceKHR
  @Deferred var physicalDevice: PhysicalDevice
  @Deferred var queueFamilyIndex: UInt32
  @Deferred var device: Device
  @Deferred var queue: Queue
  @Deferred var swapchain: Swapchain
  @Deferred var swapchainImageFormat: Format
  @Deferred var swapchainExtent: Extent2D
  @Deferred var swapchainImages: [Image]
  @Deferred var imageViews: [ImageView]
  @Deferred var renderPass: RenderPass
  @Deferred var graphicsPipeline: Pipeline
  @Deferred var pipelineLayout: PipelineLayout
  @Deferred var framebuffers: [Framebuffer]
  @Deferred var commandPool: CommandPool
  @Deferred var vertexBuffer: Buffer
  @Deferred var vertexBufferMemory: DeviceMemory
  @Deferred var commandBuffers: [CommandBuffer]
  @Deferred var imageAvailableSemaphores: [Semaphore]
  @Deferred var renderFinishedSemaphores: [Semaphore]
  @Deferred var inFlightFences: [Fence]

  let maxFramesInFlight = 2
  var currentFrameIndex = 0
  var imagesInFlightWithFences: [UInt32: Fence] = [:]

  public init() throws {
    self.setupSdl()

    try self.createInstance()
    try self.createSurface()
    try self.pickPhysicalDevice()

    try self.getQueueFamilyIndex()

    try self.createDevice()

    self.queue = Queue.create(fromDevice: self.device, presentFamilyIndex: queueFamilyIndex)

    try self.createSwapchain()

    try self.createImageViews()

    try self.createRenderPass()

    try self.createGraphicsPipeline()

    try self.createFramebuffers()

    try self.createCommandPool()

    try self.createVertexBuffer()

    try self.createCommandBuffers()

    try self.createSyncObjects()
  }

  func setupSdl() {
    SDL_Init(SDL_INIT_VIDEO)

    self.window = SDL_CreateWindow(
      "swift-vulkan-test",
      Int32(SDL_WINDOWPOS_CENTERED_MASK), Int32(SDL_WINDOWPOS_CENTERED_MASK),
      800, 600,
      SDL_WINDOW_SHOWN.rawValue | SDL_WINDOW_VULKAN.rawValue | SDL_WINDOW_RESIZABLE.rawValue
    )
  }

  func getSDLInstanceExtensions() throws -> [String] {
    var opResult = SDL_FALSE
    var countArr: [UInt32] = [0]
    var result: [String] = []

    opResult = SDL_Vulkan_GetInstanceExtensions(window, &countArr, nil)
    if opResult != SDL_TRUE {
      fatalError()
    }

    let count = Int(countArr[0])
    if count > 0 {
      let namesPtr = UnsafeMutablePointer<UnsafePointer<Int8>?>.allocate(capacity: count)
      defer {
        namesPtr.deallocate()
      }

      opResult = SDL_Vulkan_GetInstanceExtensions(window, &countArr, namesPtr)

      if opResult == SDL_TRUE {
        for i in 0..<count {
          let namePtr = namesPtr[i]
          let newName = String(cString: namePtr!)
          result.append(newName)
        }
      }
    }

    return result
  }

  func createInstance() throws {
    let sdlExtensions = try! getSDLInstanceExtensions()

    let createInfo = InstanceCreateInfo(
      applicationInfo: nil,
      enabledLayerNames: ["VK_LAYER_KHRONOS_validation"],
      enabledExtensionNames: sdlExtensions
    )

    self.instance = try Instance.createInstance(createInfo: createInfo)
  }

  func createSurface() throws {
    var surface = VkSurfaceKHR(bitPattern: 0)

    if SDL_Vulkan_CreateSurface(window, instance.pointer, &surface) != SDL_TRUE {
      fatalError("implement SDL errors! -> get the last sdl error")
    }

    self.surface = SurfaceKHR(instance: instance, surface: surface!)
  }

  func pickPhysicalDevice() throws {
    let devices = try instance.enumeratePhysicalDevices()
    self.physicalDevice = devices[0]
  }

  func getQueueFamilyIndex() throws {
    var queueFamilyIndex: UInt32?
    for properties in physicalDevice.queueFamilyProperties {
      if try! physicalDevice.hasSurfaceSupport(
        for: properties,
        surface:
          surface /*(properties.queueCount & QueueFamilyProperties.Flags.graphicsBit.rawValue == QueueFamilyProperties.Flags.graphicsBit.rawValue) &&*/
      ) {
        queueFamilyIndex = properties.index
      }
    }

    guard let queueFamilyIndexUnwrapped = queueFamilyIndex else {
      throw VulkanApplicationError.noSuitableQueueFamily
    }

    self.queueFamilyIndex = queueFamilyIndexUnwrapped
  }

  func createDevice() throws {
    let queueCreateInfo = DeviceQueueCreateInfo(
      flags: .none, queueFamilyIndex: queueFamilyIndex, queuePriorities: [1.0])

    self.device = try physicalDevice.createDevice(
      createInfo: DeviceCreateInfo(
        flags: .none,
        queueCreateInfos: [queueCreateInfo],
        enabledLayers: [],
        enabledExtensions: ["VK_KHR_swapchain"],
        enabledFeatures: PhysicalDeviceFeatures()))
  }

  func createSwapchain() throws {
    let capabilities = try physicalDevice.getSurfaceCapabilities(surface: surface)
    let surfaceFormat = try selectFormat(for: physicalDevice, surface: surface)

    // Find a supported composite alpha mode - one of these is guaranteed to be set
    var compositeAlpha: CompositeAlphaFlags = .opaque
    let desiredCompositeAlpha =
      [compositeAlpha, .preMultiplied, .postMultiplied, .inherit]

    for desired in desiredCompositeAlpha {
      if capabilities.supportedCompositeAlpha.contains(desired) {
        compositeAlpha = desired
        break
      }
    }

    self.swapchain = try Swapchain.create(
      inDevice: device,
      createInfo: SwapchainCreateInfo(
        flags: .none,
        surface: surface,
        minImageCount: capabilities.minImageCount + 1,
        imageFormat: surfaceFormat.format,
        imageColorSpace: surfaceFormat.colorSpace,
        imageExtent: capabilities.maxImageExtent,
        imageArrayLayers: 1,
        imageUsage: .colorAttachment,
        imageSharingMode: .exclusive,
        queueFamilyIndices: [],
        preTransform: capabilities.currentTransform,
        compositeAlpha: compositeAlpha,
        presentMode: .fifo,
        clipped: true,
        oldSwapchain: nil
      ))
      self.swapchainImageFormat = surfaceFormat.format
      self.swapchainExtent = capabilities.minImageExtent

    self.swapchainImages = try self.swapchain.getSwapchainImages()
  }

  func selectFormat(for gpu: PhysicalDevice, surface: SurfaceKHR) throws -> SurfaceFormat {
    let formats = try gpu.getSurfaceFormats(for: surface)

    for format in formats {
      if format.format == .B8G8R8A8_SRGB {
        return format
      }
    }

    return formats[0]
  }

  func createImageViews() throws {
    self.imageViews = try swapchainImages.map {
      try ImageView.create(device: device, createInfo: ImageViewCreateInfo(
        flags: .none, 
        image: $0, 
        viewType: .type2D, 
        format: swapchainImageFormat, 
        components: .identity, 
        subresourceRange: ImageSubresourceRange(
          aspectMask: .color, 
          baseMipLevel: 0, 
          levelCount: 1, 
          baseArrayLayer: 0, 
          layerCount: 1)))
    }
  }

  func createRenderPass() throws {
    let colorAttachment = AttachmentDescription(
      flags: .none,
      format: swapchainImageFormat,
      samples: ._1bit,
      loadOp: .clear,
      storeOp: .store,
      stencilLoadOp: .dontCare,
      stencilStoreOp: .dontCare,
      initialLayout: .undefined,
      finalLayout: .presentSrc 
    )

    let colorAttachmentRef = AttachmentReference(
      attachment: 0, layout: .colorAttachmentOptimal 
    )

    let subpass = SubpassDescription(
      flags: .none,
      pipelineBindPoint: .graphics,
      inputAttachments: nil,
      colorAttachments: [colorAttachmentRef],
      resolveAttachments: nil,
      depthStencilAttachment: nil,
      preserveAttachments: nil
    )

    let dependency = SubpassDependency(
      srcSubpass: VK_SUBPASS_EXTERNAL,
      dstSubpass: 0,
      srcStageMask: .colorAttachmentOutput,
      dstStageMask: .colorAttachmentOutput,
      srcAccessMask: .none,
      dstAccessMask: .colorAttachmentWrite,
      dependencyFlags: .none
    )

    let renderPassInfo = RenderPassCreateInfo(
      flags: .none,
      attachments: [colorAttachment],
      subpasses: [subpass],
      dependencies: [dependency]
    )

    self.renderPass = try RenderPass.create(createInfo: renderPassInfo, device: device)
  }

  func createGraphicsPipeline() throws {
    let vertexShaderCode: Data = try Data(contentsOf: Bundle.module.url(forResource: "vertex", withExtension: "spv")!)
    let fragmentShaderCode: Data = try Data(contentsOf: Bundle.module.url(forResource: "fragment", withExtension: "spv")!)

    let vertexShaderModule = try ShaderModule(device: device, createInfo: ShaderModuleCreateInfo(
      code: vertexShaderCode
    ))
    let vertexShaderStageCreateInfo = PipelineShaderStageCreateInfo(
      flags: .none,
      stage: .vertex,
      module: vertexShaderModule,
      name: "main",
      specializationInfo: nil)

    let fragmentShaderModule = try ShaderModule(device: device, createInfo: ShaderModuleCreateInfo(
      code: fragmentShaderCode
    ))
    let fragmentShaderStageCreateInfo = PipelineShaderStageCreateInfo(
      flags: .none,
      stage: .fragment,
      module: fragmentShaderModule,
      name: "main",
      specializationInfo: nil)

    let shaderStages = [vertexShaderStageCreateInfo, fragmentShaderStageCreateInfo]

    let vertexInputBindingDescription = VertexInputBindingDescription(
      binding: 0,
      stride: UInt32(MemoryLayout<Float>.size * 5),
      inputRate: .vertex
    )

    let vertexInputAttributeDescriptions = [
      VertexInputAttributeDescription(
        location: 0,
        binding: 0,
        format: .R32G32_SFLOAT,
        offset: 0
      ),
      VertexInputAttributeDescription(
        location: 1,
        binding: 0,
        format: .R32G32B32_SFLOAT,
        offset: UInt32(MemoryLayout<Float>.size * 2)
      )
    ]

    let vertexInputInfo = PipelineVertexInputStateCreateInfo(
      vertexBindingDescriptions: [vertexInputBindingDescription],
      vertexAttributeDescriptions: vertexInputAttributeDescriptions
    )

    let inputAssembly = PipelineInputAssemblyStateCreateInfo(topology: .triangleList, primitiveRestartEnable: false)

    let viewport = Viewport(x: 0, y: 0, width: Float(swapchainExtent.width), height: Float(swapchainExtent.height), minDepth: 0, maxDepth: 1)

    let scissor = Rect2D(offset: Offset2D(x: 0, y: 0), extent: swapchainExtent)

    let viewportState = PipelineViewportStateCreateInfo(
      viewports: [viewport],
      scissors: [scissor]
    )

    let rasterizer = PipelineRasterizationStateCreateInfo(
      depthClampEnable: false,
      rasterizerDiscardEnable: false,
      polygonMode: .fill,
      cullMode: .none,
      frontFace: .clockwise,
      depthBiasEnable: false,
      depthBiasConstantFactor: 0,
      depthBiasClamp: 0,
      depthBiasSlopeFactor: 0,
      lineWidth: 1
    )

    let multisampling = PipelineMultisampleStateCreateInfo(
      rasterizationSamples: ._1bit,
      sampleShadingEnable: false,
      minSampleShading: 1,
      sampleMask: nil, 
      alphaToCoverageEnable: false,
      alphaToOneEnable: false
    )

    let colorBlendAttachment = PipelineColorBlendAttachmentState(
      blendEnable: false,
      srcColorBlendFactor: .one,
      dstColorBlendFactor: .zero,
      colorBlendOp: VK_BLEND_OP_ADD,
      srcAlphaBlendFactor: .one,
      dstAlphaBlendFactor: .zero,
      alphaBlendOp: VK_BLEND_OP_ADD,
      colorWriteMask: [.r, .g, .b, .a]
    )

    let colorBlending = PipelineColorBlendStateCreateInfo(
      logicOpEnable: false,
      logicOp: .copy,
      attachments: [colorBlendAttachment],
      blendConstants: (0, 0, 0, 0)
    )

    let dynamicStates = [DynamicState.VIEWPORT, DynamicState.LINE_WIDTH]

    let dynamicState = PipelineDynamicStateCreateInfo(
      dynamicStates: dynamicStates
    )

    let pipelineLayoutInfo = PipelineLayoutCreateInfo(
      flags: .none,
      setLayouts: [],
      pushConstantRanges: [])

    let pipelineLayout = try PipelineLayout.create(device: device, createInfo: pipelineLayoutInfo)

    let pipelineInfo = GraphicsPipelineCreateInfo(
      flags: 0,
      stages: shaderStages,
      vertexInputSate: vertexInputInfo,
      inputAssemblyState: inputAssembly,
      tessellationState: Void(),
      viewportState: viewportState,
      rasterizationState: rasterizer,
      multisampleState: multisampling,
      depthStencilState: Void(),
      colorBlendState: colorBlending,
      dynamicState: nil,
      layout: pipelineLayout,
      renderPass: renderPass,
      subpass: 0
    )

    let graphicsPipeline = try Pipeline(device: device, createInfo: pipelineInfo)

    self.graphicsPipeline = graphicsPipeline
    self.pipelineLayout = pipelineLayout
  }

  func createFramebuffers() throws {
    self.framebuffers = try imageViews.map { imageView in
      let framebufferInfo = FramebufferCreateInfo(
        flags: [],
        renderPass: renderPass,
        attachments: [imageView],
        width: swapchainExtent.width,
        height: swapchainExtent.height,
        layers: 1 
      )
      return try Framebuffer(device: device, createInfo: framebufferInfo)
    }
  }

  func createCommandPool() throws {
    self.commandPool = try CommandPool.create(from: device, info: CommandPoolCreateInfo(
      flags: .none,
      queueFamilyIndex: queueFamilyIndex
    ))
  }

  func createVertexBuffer() throws {
    let vertices: [Float] = [
      0, -0.5, 0, 1, 0,
      0.5, 0.5, 1, 0, 0,
      -0.5, 0.5, 0, 0, 1
    ]
    /*let vertices = [
      Vertex(position: (0, -0.5), color: (0, 1, 0)),
      Vertex(position: (0.5, 0.5), color: (1, 0, 0)),
      Vertex(position: (-0.5, 0.5), color: (0, 0, 1))
    ]*/

    let verticesPointer = UnsafeMutableBufferPointer<Float>.allocate(capacity: 15)
    for i in 0..<15 {
      verticesPointer[i] = 1.0
    }

    let bufferInfo = BufferCreateInfo(
      flags: .none,
      size: DeviceSize(MemoryLayout<Float>.size * vertices.count),
      usage: .vertexBuffer,
      sharingMode: .exclusive,
      queueFamilyIndices: nil)
    vertexBuffer = try Buffer.create(device: device, createInfo: bufferInfo)

    let memRequirements = vertexBuffer.memoryRequirements

    vertexBufferMemory = try DeviceMemory.allocateMemory(inDevice: device, allocInfo: MemoryAllocateInfo(
      allocationSize: memRequirements.size,
      memoryTypeIndex: try findMemoryType(typeFilter: memRequirements.memoryTypeBits, properties: MemoryPropertyFlags.hostVisible.rawValue | MemoryPropertyFlags.hostCoherent.rawValue)
    ))

    try vertexBuffer.bindMemory(memory: vertexBufferMemory)

    var cpuVertexBufferMemory: UnsafeMutableRawPointer? = nil
    try vertexBufferMemory.mapMemory(offset: 0, size: bufferInfo.size, flags: .none, data: &cpuVertexBufferMemory)
    cpuVertexBufferMemory!.copyMemory(from: vertices, byteCount: MemoryLayout<Float>.size * vertices.count)
    vertexBufferMemory.unmapMemory()
  }

  func findMemoryType(typeFilter: UInt32, properties: UInt32) throws -> UInt32 {
    let memProperties = try physicalDevice.getMemoryProperties()
    for (index, checkType) in memProperties.memoryTypes.enumerated() {
      if typeFilter & (1 << index) != 0 && checkType.propertyFlags.rawValue & properties == properties {
        return UInt32(index)
      }
    }

    throw VulkanApplicationError.noSuitableMemoryType 
  }

  func createCommandBuffers() throws {
    self.commandBuffers = try framebuffers.map { framebuffer in
      let commandBuffer = try CommandBuffer.allocate(device: device, info: CommandBufferAllocateInfo(
        commandPool: commandPool,
        level: .primary,
        commandBufferCount: 1))

      commandBuffer.begin(CommandBufferBeginInfo(
        flags: [],
        inheritanceInfo: nil))

      commandBuffer.beginRenderPass(beginInfo: RenderPassBeginInfo(
        renderPass: renderPass,
        framebuffer: framebuffer,
        renderArea: Rect2D(
          offset: Offset2D(x: 0, y: 0), extent: swapchainExtent
        ),
        clearValues: [ClearColorValue.float32(0, 0, 0, 1).eraseToAny()]
      ), contents: .inline)

      commandBuffer.bindPipeline(pipelineBindPoint: .graphics, pipeline: graphicsPipeline)

      commandBuffer.bindVertexBuffers(firstBinding: 0, buffers: [vertexBuffer], offsets: [0])

      commandBuffer.draw(vertexCount: 3, instanceCount: 1, firstVertex: 0, firstInstance: 0)

      commandBuffer.endRenderPass()
      commandBuffer.end()

      return commandBuffer
    }
  }

  func createSyncObjects() throws {
    imageAvailableSemaphores = try (0..<maxFramesInFlight).map { _ in 
      try Semaphore.create(info: SemaphoreCreateInfo(
        flags: .none
      ), device: device)
    }

    renderFinishedSemaphores = try (0..<maxFramesInFlight).map { _ in 
      try Semaphore.create(info: SemaphoreCreateInfo(
        flags: .none
      ), device: device)
    }

    inFlightFences = try (0..<maxFramesInFlight).map { _ in
      try Fence(device: device, createInfo: FenceCreateInfo(
        flags: [.signaled]
      ))
    }
  }

  func recreateSwapchain() throws {
    var windowWidth: Int32 = 0
    var windowHeight: Int32 = 0
    SDL_GetWindowSize(window, &windowWidth, &windowHeight)
    var event = SDL_Event()
    while windowWidth == 0 || windowHeight == 0 {
      SDL_WaitEvent(&event)
      SDL_GetWindowSize(window, &windowWidth, &windowHeight)
    }

    device.waitIdle()

    try createSwapchain()
    try createImageViews()
    try createRenderPass()
    try createGraphicsPipeline()
    try createFramebuffers()
    try createCommandBuffers()
  }

  func cleanupSwapchain() {
    framebuffers.forEach { $0.destroy() }
    CommandBuffer.free(commandBuffers: commandBuffers, device: device, commandPool: commandPool)
    graphicsPipeline.destroy()
    renderPass.destroy()
    imageViews.forEach { $0.destroy() }
    swapchain.destroy()
  }

  func drawFrame() throws {
    let imageAvailableSemaphore = imageAvailableSemaphores[currentFrameIndex]
    let renderFinishedSemaphore = renderFinishedSemaphores[currentFrameIndex]
    let inFlightFence = inFlightFences[currentFrameIndex]

    inFlightFence.wait(timeout: .max)

    let (imageIndex, acquireImageResult) = try swapchain.acquireNextImage(timeout: .max, semaphore: imageAvailableSemaphore, fence: nil)

    if acquireImageResult == .errorOutOfDateKhr {
      device.waitIdle()
      queue.waitIdle()
      cleanupSwapchain()
      try recreateSwapchain()
      return
    } else if acquireImageResult != .success && acquireImageResult != .suboptimalKhr {
      throw UnexpectedVulkanResultError(acquireImageResult)
    }

    if let previousFence = imagesInFlightWithFences[imageIndex] {
      previousFence.wait(timeout: .max)
    }
    imagesInFlightWithFences[imageIndex] = inFlightFence
    inFlightFence.reset()

    try queue.submit(submits: [
      SubmitInfo(
        waitSemaphores: [imageAvailableSemaphore],
        waitDstStageMask: [.colorAttachmentOutput],
        commandBuffers: [commandBuffers[Int(imageIndex)]],
        signalSemaphores: [renderFinishedSemaphore]
      )
    ], fence: inFlightFence)
    let presentResult = queue.present(presentInfo: PresentInfoKHR(
      waitSemaphores: [renderFinishedSemaphore],
      swapchains: [swapchain],
      imageIndices: [imageIndex],
      results: ()
    ))

    if presentResult == .errorOutOfDateKhr || presentResult == .suboptimalKhr {
      device.waitIdle()
      queue.waitIdle()
      cleanupSwapchain()
      try recreateSwapchain()
      return
    } else if presentResult != .success {
      throw UnexpectedVulkanResultError(acquireImageResult)
    }

    currentFrameIndex += 1
    currentFrameIndex %= maxFramesInFlight
  }

  func mainLoop() throws {
    var event = SDL_Event()
    event.type = 0
    while SDL_PollEvent(&event) != 0 {
      if event.type == SDL_QUIT.rawValue {
        device.waitIdle()
        exit(0)
      }
    }
    
    try drawFrame()

    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [unowned self] in
      try! mainLoop()
    }
  }

  func destroy() {
    //vertexBuffer.destroy()
  }

  public enum VulkanApplicationError: Error {
    case noSuitableQueueFamily,
      noSuitableMemoryType
  }
}

let vulkanApplication = try! VulkanApplication()

try! vulkanApplication.mainLoop()

dispatchMain()

public struct UnexpectedVulkanResultError: Error {
  public let result: Result 

  public init(_ result: Result) {
    self.result = result
  }
}