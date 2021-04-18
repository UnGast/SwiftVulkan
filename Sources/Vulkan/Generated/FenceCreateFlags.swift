import CVulkan

public struct FenceCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkFenceCreateFlags {
    VkFenceCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkFenceCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkFenceCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let signaled = Self(rawValue: 1 << 0)
}

public struct FenceCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkFenceCreateFlagBits {
    VkFenceCreateFlagBits(rawValue)
  }

  public static let signaled = Self(rawValue: 1 << 0)
}