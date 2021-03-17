import CVulkan

public struct ImageViewCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkImageViewCreateFlags {
    VkImageViewCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkImageViewCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkImageViewCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

public struct ImageViewCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkImageViewCreateFlagBits {
    VkImageViewCreateFlagBits(rawValue)
  }

  
}