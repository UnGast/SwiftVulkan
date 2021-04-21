import CVulkan

public struct ImageUsageFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkImageUsageFlags {
    VkImageUsageFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkImageUsageFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkImageUsageFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let transferSrc = Self(rawValue: 1 << 0)
public static let transferDst = Self(rawValue: 1 << 1)
public static let sampled = Self(rawValue: 1 << 2)
public static let storage = Self(rawValue: 1 << 3)
public static let colorAttachment = Self(rawValue: 1 << 4)
public static let depthStencilAttachment = Self(rawValue: 1 << 5)
public static let transientAttachment = Self(rawValue: 1 << 6)
public static let inputAttachment = Self(rawValue: 1 << 7)
}

public struct ImageUsageFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkImageUsageFlagBits {
    VkImageUsageFlagBits(rawValue)
  }

  public static let transferSrc = Self(rawValue: 1 << 0)
public static let transferDst = Self(rawValue: 1 << 1)
public static let sampled = Self(rawValue: 1 << 2)
public static let storage = Self(rawValue: 1 << 3)
public static let colorAttachment = Self(rawValue: 1 << 4)
public static let depthStencilAttachment = Self(rawValue: 1 << 5)
public static let transientAttachment = Self(rawValue: 1 << 6)
public static let inputAttachment = Self(rawValue: 1 << 7)
}