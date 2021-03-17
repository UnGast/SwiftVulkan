import CVulkan

public enum SamplerMipmapMode: UInt32, VulkanEnumTypeWrapper {
  case nearest = 0,
linear = 1

  public init(fromVulkan: VkSamplerMipmapMode) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkSamplerMipmapMode {
    VkSamplerMipmapMode(rawValue)
  }
}