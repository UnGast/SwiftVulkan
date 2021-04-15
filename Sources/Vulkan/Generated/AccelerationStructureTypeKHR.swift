import CVulkan

public enum AccelerationStructureTypeKHR: UInt32, VulkanEnumTypeWrapper {
  case vkAccelerationStructureTypeTopLevelKhr = 0,
vkAccelerationStructureTypeBottomLevelKhr = 1,
vkAccelerationStructureTypeGenericKhr = 2

  public init(fromVulkan: VkAccelerationStructureTypeKHR) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkAccelerationStructureTypeKHR {
    VkAccelerationStructureTypeKHR(rawValue)
  }
}