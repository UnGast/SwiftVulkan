import CVulkan

public enum SamplerAddressMode: UInt32, VulkanEnumTypeWrapper {
  case `repeat` = 0,
mirroredRepeat = 1,
clampToEdge = 2,
clampToBorder = 3

  public init(fromVulkan: VkSamplerAddressMode) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkSamplerAddressMode {
    VkSamplerAddressMode(rawValue)
  }
}