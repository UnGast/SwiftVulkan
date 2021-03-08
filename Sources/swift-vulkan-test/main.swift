import Foundation
import CSDL2
import CSDL2Vulkan
import CVulkan
import Vulkan

// SPRIV Compiler? https://github.com/stuartcarnie/SwiftSPIRV-Cross

SDL_Init(SDL_INIT_VIDEO)

let window = SDL_CreateWindow(
  "swift-vulkan-test",
  Int32(SDL_WINDOWPOS_CENTERED_MASK), Int32(SDL_WINDOWPOS_CENTERED_MASK),
  800, 600,
  SDL_WINDOW_SHOWN.rawValue | SDL_WINDOW_VULKAN.rawValue
)

public func getSDLInstanceExtensions() throws -> [String] {
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

@propertyWrapper
public class Deferred<T> {
  private var value: T?
  public var wrappedValue: T {
    get { value! }
    set { value = newValue }
  }

  public init() {}
}

public class VulkanApplication {
  let instance: Instance
  let surface: SurfaceKHR
  let physicalDevice: PhysicalDevice
  let queueFamilyIndex: UInt32
  let device: Device
  let queue: Queue
  let swapchain: Swapchain
  let swapchainImageFormat: Format
  let swapchainExtent: Extent2D
  let swapchainImages: [Image]
  let imageViews: [ImageView]
  let renderPass: RenderPass
  let graphicsPipeline: Pipeline
  let pipelineLayout: PipelineLayout
  let framebuffers: [Framebuffer]
  let commandPool: CommandPool
  @Deferred var commandBuffers: [CommandBuffer]

  public init() throws {
    self.instance = try Self.createInstance()
    self.surface = try Self.createSurface(instance: self.instance)
    self.physicalDevice = try Self.pickPhysicalDevice(instance: self.instance)

    self.queueFamilyIndex = try Self.getQueueFamilyIndex(
      physicalDevice: self.physicalDevice, surface: self.surface)

    self.device = try Self.createDevice(
      physicalDevice: self.physicalDevice, queueFamilyIndex: queueFamilyIndex)

    self.queue = Queue.create(fromDevice: self.device, presentFamilyIndex: queueFamilyIndex)

    (self.swapchain, self.swapchainImageFormat, self.swapchainExtent) = try Self.createSwapchain(
      physicalDevice: self.physicalDevice, device: self.device, surface: self.surface)
    self.swapchainImages = try self.swapchain.getSwapchainImages()

    self.imageViews = try Self.createImageViews(swapchainImages: self.swapchainImages, swapchainImageFormat: self.swapchainImageFormat, device: self.device)

    self.renderPass = try Self.createRenderPass(swapchainImageFormat: self.swapchainImageFormat, device: self.device)

    (self.graphicsPipeline, self.pipelineLayout) = try Self.createGraphicsPipeline(device: self.device, swapchainExtent: self.swapchainExtent, renderPass: self.renderPass)

    self.framebuffers = try Self.createFramebuffers(device: self.device, swapchainImageViews: self.imageViews, renderPass: self.renderPass, swapchainExtent: self.swapchainExtent)

    self.commandPool = try Self.createCommandPool(device: self.device, queueFamilyIndex: self.queueFamilyIndex)

    try self.createCommandBuffers()
  }

  static func createInstance() throws -> Instance {
    let sdlExtensions = try! getSDLInstanceExtensions()

    let createInfo = InstanceCreateInfo(
      applicationInfo: nil,
      enabledLayerNames: ["VK_LAYER_KHRONOS_validation"],
      enabledExtensionNames: sdlExtensions
    )

    return try Instance.createInstance(createInfo: createInfo)
  }

  static func createSurface(instance: Instance) throws -> SurfaceKHR {
    var surface = VkSurfaceKHR(bitPattern: 0)

    if SDL_Vulkan_CreateSurface(window, instance.pointer, &surface) != SDL_TRUE {
      fatalError("implement SDL errors! -> get the last sdl error")
    }

    return SurfaceKHR(instance: instance, surface: surface!)
  }

  static func pickPhysicalDevice(instance: Instance) throws -> PhysicalDevice {
    let devices = try instance.enumeratePhysicalDevices()
    return devices[0]
  }

  static func getQueueFamilyIndex(physicalDevice: PhysicalDevice, surface: SurfaceKHR) throws
    -> UInt32
  {
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

    return queueFamilyIndexUnwrapped
  }

  static func createDevice(physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32) throws
    -> Device
  {
    let queueCreateInfo = DeviceQueueCreateInfo(
      flags: .none, queueFamilyIndex: queueFamilyIndex, queuePriorities: [1.0])

    return try physicalDevice.createDevice(
      createInfo: DeviceCreateInfo(
        flags: .none,
        queueCreateInfos: [queueCreateInfo],
        enabledLayers: [],
        enabledExtensions: ["VK_KHR_swapchain"],
        enabledFeatures: PhysicalDeviceFeatures()))
  }

  static func createSwapchain(physicalDevice: PhysicalDevice, device: Device, surface: SurfaceKHR)
    throws -> (Swapchain, Format, Extent2D)
  {
    let capabilities = try physicalDevice.getSurfaceCapabilities(surface: surface)
    let surfaceFormat = try selectFormat(for: physicalDevice, surface: surface)

    //let presentModes = try gpu.getSurfacePresentModes(surface: surface)
    let preTransform =
      capabilities.supportedTransforms.contains(.identity)
      ? .identity : capabilities.currentTransform

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

    return (try Swapchain.create(
      inDevice: device,
      createInfo: SwapchainCreateInfo(
        flags: .none,
        surface: surface,
        minImageCount: capabilities.maxImageCount,
        imageFormat: surfaceFormat.format,
        imageColorSpace: surfaceFormat.colorSpace,
        imageExtent: capabilities.maxImageExtent,
        imageArrayLayers: 1,
        imageUsage: .colorAttachment,
        imageSharingMode: .exclusive,
        queueFamilyIndices: [0],
        preTransform: preTransform,
        compositeAlpha: compositeAlpha,
        presentMode: .fifo,
        clipped: true,
        oldSwapchain: nil
      )), surfaceFormat.format, capabilities.maxImageExtent)
  }

  static func selectFormat(for gpu: PhysicalDevice, surface: SurfaceKHR) throws -> SurfaceFormat {
    let formats = try gpu.getSurfaceFormats(for: surface)

    for format in formats {
      if format.format == .R8G8B8A8_UNORM {
        return format
      }
    }

    for format in formats {
      if format.format == .B8G8R8A8_SRGB {
        return format
      }
    }

    return formats[0]
  }

  static func createImageViews(swapchainImages: [Image], swapchainImageFormat: Format, device: Device) throws -> [ImageView] {
    try swapchainImages.map {
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

  static func createRenderPass(swapchainImageFormat: Format, device: Device) throws -> RenderPass {
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

    let renderPassInfo = RenderPassCreateInfo(
      flags: .none,
      attachments: [colorAttachment],
      subpasses: [subpass],
      dependencies: nil
    )

    return try RenderPass.create(createInfo: renderPassInfo, device: device)
  }

  static func createGraphicsPipeline(device: Device, swapchainExtent: Extent2D, renderPass: RenderPass) throws -> (Pipeline, PipelineLayout) {
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

    let vertexInputInfo = PipelineVertexInputStateCreateInfo(
      vertexBindingDescriptions: [],
      vertexAttributeDescriptions: []
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
      cullMode: .back,
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

    return (graphicsPipeline, pipelineLayout)
  }

  static func createFramebuffers(device: Device, swapchainImageViews: [ImageView], renderPass: RenderPass, swapchainExtent: Extent2D) throws -> [Framebuffer] {
    try swapchainImageViews.map { imageView in
      let framebufferInfo = FramebufferCreateInfo(
        flags: .none,
        renderPass: renderPass,
        attachments: [imageView],
        width: swapchainExtent.width,
        height: swapchainExtent.height,
        layers: 1 
      )
      return try Framebuffer(device: device, createInfo: framebufferInfo)
    }
  }

  static func createCommandPool(device: Device, queueFamilyIndex: UInt32) throws -> CommandPool {
    try CommandPool.create(from: device, info: CommandPoolCreateInfo(
      flags: .none,
      queueFamilyIndex: queueFamilyIndex
    ))
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

      commandBuffer.draw(vertexCount: 3, instanceCount: 1, firstVertex: 0, firstInstance: 0)

      commandBuffer.endRenderPass()
      commandBuffer.end()

      return commandBuffer
    }
  }

  public enum VulkanApplicationError: Error {
    case noSuitableQueueFamily
  }
}

let vulkanApplication = try VulkanApplication()

SDL_Delay(100)

print("REACHED HERE")