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

public class VulkanApplication {
  let instance: Instance
  let surface: SurfaceKHR
  let physicalDevice: PhysicalDevice
  let device: Device
  let queue: Queue
  let swapchain: Swapchain

  public init() {
    self.instance = try! Self.createInstance()
    self.surface = try! Self.createSurface(instance: self.instance)
    self.physicalDevice = try! Self.pickPhysicalDevice(instance: self.instance)
    let queueFamilyIndex = try! Self.getQueueFamilyIndex(physicalDevice: self.physicalDevice, surface: self.surface)
    self.device = try! Self.createDevice(physicalDevice: self.physicalDevice, queueFamilyIndex: queueFamilyIndex)
    self.queue = Queue.create(fromDevice: self.device, presentFamilyIndex: queueFamilyIndex)
    self.swapchain = try! Self.createSwapchain(physicalDevice: self.physicalDevice, device: self.device, surface: self.surface)
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

  static func getQueueFamilyIndex(physicalDevice: PhysicalDevice, surface: SurfaceKHR) throws -> UInt32 {
    var queueFamilyIndex: UInt32?
    for properties in physicalDevice.queueFamilyProperties {
      if /*(properties.queueCount & QueueFamilyProperties.Flags.graphicsBit.rawValue == QueueFamilyProperties.Flags.graphicsBit.rawValue) &&*/
       (try! physicalDevice.hasSurfaceSupport(for: properties, surface: surface)) {
          queueFamilyIndex = properties.index
      }
    }

    guard let queueFamilyIndexUnwrapped = queueFamilyIndex else {
      throw VulkanApplicationError.noSuitableQueueFamily
    }

    return queueFamilyIndexUnwrapped
  }

  static func createDevice(physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32) throws -> Device {
    let queueCreateInfo = DeviceQueueCreateInfo(flags: .none, queueFamilyIndex: queueFamilyIndex, queuePriorities: [1.0])

    return try physicalDevice.createDevice(createInfo: DeviceCreateInfo(
      flags: .none,
      queueCreateInfos: [queueCreateInfo],
      enabledLayers: [],
      enabledExtensions: ["VK_KHR_swapchain"],
      enabledFeatures: PhysicalDeviceFeatures()))
  }

  static func createSwapchain(physicalDevice: PhysicalDevice, device: Device, surface: SurfaceKHR) throws -> Swapchain {
    let capabilities = try physicalDevice.getSurfaceCapabilities(surface: surface)
    let surfaceFormat = try selectFormat(for: physicalDevice, surface: surface)

    //let presentModes = try gpu.getSurfacePresentModes(surface: surface)
    let preTransform = capabilities.supportedTransforms.contains(.identity) ?
            .identity : capabilities.currentTransform

    // Find a supported composite alpha mode - one of these is guaranteed to be set
    var compositeAlpha: CompositeAlphaFlags = .opaque;
    let desiredCompositeAlpha =
            [compositeAlpha, .preMultiplied, .postMultiplied, .inherit]

    for desired in desiredCompositeAlpha {
        if capabilities.supportedCompositeAlpha.contains(desired) {
            compositeAlpha = desired
            break
        }
    }

    return try Swapchain.create(inDevice: device, createInfo: SwapchainCreateInfo(
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
    ))
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

  public enum VulkanApplicationError: Error {
    case noSuitableQueueFamily
  }
}

let vulkanApplication = VulkanApplication()

SDL_Delay(100)
