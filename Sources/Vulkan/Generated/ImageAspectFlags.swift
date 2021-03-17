import CVulkan

public struct ImageAspectFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkImageAspectFlags {
    VkImageAspectFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkImageAspectFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkImageAspectFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let color = Self(rawValue: 1 << 0)
public static let depth = Self(rawValue: 1 << 1)
public static let stencil = Self(rawValue: 1 << 2)
public static let metadata = Self(rawValue: 1 << 3)
}

public struct ImageAspectFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkImageAspectFlagBits {
    VkImageAspectFlagBits(rawValue)
  }

  public static let color = Self(rawValue: 1 << 0)
public static let depth = Self(rawValue: 1 << 1)
public static let stencil = Self(rawValue: 1 << 2)
public static let metadata = Self(rawValue: 1 << 3)
}