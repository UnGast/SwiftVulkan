import CVulkan

public struct FramebufferCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkFramebufferCreateFlags {
    VkFramebufferCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkFramebufferCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkFramebufferCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

public struct FramebufferCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkFramebufferCreateFlagBits {
    VkFramebufferCreateFlagBits(rawValue)
  }

  
}