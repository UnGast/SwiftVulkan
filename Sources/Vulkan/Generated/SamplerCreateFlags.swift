import CVulkan

public struct SamplerCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkSamplerCreateFlags {
    VkSamplerCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkSamplerCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkSamplerCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

public struct SamplerCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkSamplerCreateFlagBits {
    VkSamplerCreateFlagBits(rawValue)
  }

  
}