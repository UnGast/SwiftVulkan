import CVulkan

public enum BuildAccelerationStructureModeKHR: UInt32, VulkanEnumTypeWrapper {
  case vkBuildAccelerationStructureModeBuildKhr = 0,
vkBuildAccelerationStructureModeUpdateKhr = 1

  public init(fromVulkan: VkBuildAccelerationStructureModeKHR) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkBuildAccelerationStructureModeKHR {
    VkBuildAccelerationStructureModeKHR(rawValue)
  }
}