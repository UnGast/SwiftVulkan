import CVulkan

public enum Filter: UInt32 {
  case nearest = 0,
linear = 1

  public var vulkan: VkFilter {
    VkFilter(rawValue)
  }
}