import CVulkan

public enum SamplerMipmapMode: UInt32 {
  case nearest = 0,
linear = 1

  public var vulkan: VkSamplerMipmapMode {
    VkSamplerMipmapMode(rawValue)
  }
}