import CVulkan

public enum AccelerationStructureBuildTypeKHR: UInt32, VulkanEnumTypeWrapper {
  case vkAccelerationStructureBuildTypeHostKhr = 0,
vkAccelerationStructureBuildTypeDeviceKhr = 1,
vkAccelerationStructureBuildTypeHostOrDeviceKhr = 2

  public init(fromVulkan: VkAccelerationStructureBuildTypeKHR) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkAccelerationStructureBuildTypeKHR {
    VkAccelerationStructureBuildTypeKHR(rawValue)
  }
}