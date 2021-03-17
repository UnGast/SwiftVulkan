import CVulkan

public struct ColorComponentFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkColorComponentFlags {
    VkColorComponentFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkColorComponentFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkColorComponentFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let r = Self(rawValue: 1 << 0)
public static let g = Self(rawValue: 1 << 1)
public static let b = Self(rawValue: 1 << 2)
public static let a = Self(rawValue: 1 << 3)
}

public struct ColorComponentFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkColorComponentFlagBits {
    VkColorComponentFlagBits(rawValue)
  }

  public static let r = Self(rawValue: 1 << 0)
public static let g = Self(rawValue: 1 << 1)
public static let b = Self(rawValue: 1 << 2)
public static let a = Self(rawValue: 1 << 3)
}