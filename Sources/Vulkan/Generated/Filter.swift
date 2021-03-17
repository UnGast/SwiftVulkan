import CVulkan

public enum Filter: UInt32, VulkanEnumTypeWrapper {
  case nearest = 0,
linear = 1

  public init(fromVulkan: VkFilter) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkFilter {
    VkFilter(rawValue)
  }
}