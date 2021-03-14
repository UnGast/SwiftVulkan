import CVulkan

public struct ImageViewCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkImageViewCreateFlags {
    VkImageViewCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  
}