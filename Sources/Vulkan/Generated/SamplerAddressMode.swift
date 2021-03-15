import CVulkan

public enum SamplerAddressMode: UInt32 {
  case `repeat` = 0,
mirroredRepeat = 1,
clampToEdge = 2,
clampToBorder = 3

  public var vulkan: VkSamplerAddressMode {
    VkSamplerAddressMode(rawValue)
  }
}