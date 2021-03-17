import CVulkan

public enum PhysicalDeviceType: UInt32, VulkanEnumTypeWrapper {
  case other = 0,
integratedGpu = 1,
discreteGpu = 2,
virtualGpu = 3,
cpu = 4

  public init(fromVulkan: VkPhysicalDeviceType) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkPhysicalDeviceType {
    VkPhysicalDeviceType(rawValue)
  }
}