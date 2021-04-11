import CVulkan

public struct ApplicationInfo: VulkanTypeWrapper {
  public var pApplicationName: String?
public var applicationVersion: UInt32
public var pEngineName: String?
public var engineVersion: UInt32
public var apiVersion: UInt32

  

  public init(
    pApplicationName: String? = nil,
applicationVersion: UInt32,
pEngineName: String? = nil,
engineVersion: UInt32,
apiVersion: UInt32
  ) {
    self.pApplicationName = pApplicationName
self.applicationVersion = applicationVersion
self.pEngineName = pEngineName
self.engineVersion = engineVersion
self.apiVersion = apiVersion
  }

  public var vulkan: VkApplicationInfo {
    mutating get {
      
      return VkApplicationInfo(
        sType: VK_STRUCTURE_TYPE_APPLICATION_INFO,
pNext: nil,
pApplicationName: pApplicationName?.vulkan,
applicationVersion: applicationVersion.vulkan,
pEngineName: pEngineName?.vulkan,
engineVersion: engineVersion.vulkan,
apiVersion: apiVersion.vulkan
      )
    }
  }
}