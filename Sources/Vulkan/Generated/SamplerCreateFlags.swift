import CVulkan

public struct SamplerCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkSamplerCreateFlags {
    VkSamplerCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  
}