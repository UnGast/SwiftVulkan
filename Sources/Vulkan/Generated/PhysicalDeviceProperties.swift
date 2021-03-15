import CVulkan

public struct PhysicalDeviceProperties: VulkanTypeWrapper {
  public var apiVersion: UInt32
public var driverVersion: UInt32
public var vendorID: UInt32
public var deviceID: UInt32
public var deviceType: PhysicalDeviceType
public var deviceName: String
public var pipelineCacheUUID: [UInt8]
public var limits: PhysicalDeviceLimits
public var sparseProperties: PhysicalDeviceSparseProperties

  

  public init(
    apiVersion: UInt32,
driverVersion: UInt32,
vendorID: UInt32,
deviceID: UInt32,
deviceType: PhysicalDeviceType,
deviceName: String,
pipelineCacheUUID: [UInt8],
limits: PhysicalDeviceLimits,
sparseProperties: PhysicalDeviceSparseProperties
  ) {
    self.apiVersion = apiVersion
self.driverVersion = driverVersion
self.vendorID = vendorID
self.deviceID = deviceID
self.deviceType = deviceType
self.deviceName = deviceName
self.pipelineCacheUUID = pipelineCacheUUID
self.limits = limits
self.sparseProperties = sparseProperties
  }

  public init(fromVulkan vulkan: VkPhysicalDeviceProperties) {
    self.init(
      apiVersion: UInt32(fromVulkan: vulkan.apiVersion),
driverVersion: UInt32(fromVulkan: vulkan.driverVersion),
vendorID: UInt32(fromVulkan: vulkan.vendorID),
deviceID: UInt32(fromVulkan: vulkan.deviceID),
deviceType: PhysicalDeviceType(fromVulkan: vulkan.deviceType),
deviceName: "FIXED LENGTH STRING CONVERSION NOT IMPLEMENTED",
pipelineCacheUUID: convertTupleToArray(vulkan.pipelineCacheUUID),
limits: PhysicalDeviceLimits(fromVulkan: vulkan.limits),
sparseProperties: PhysicalDeviceSparseProperties(fromVulkan: vulkan.sparseProperties)
    )
  }

  public var vulkan: VkPhysicalDeviceProperties {
    mutating get {
      fatalError("PhysicalDeviceProperties is a return-only type")
    }
  }
}