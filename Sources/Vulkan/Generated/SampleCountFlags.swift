import CVulkan

public struct SampleCountFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkSampleCountFlags {
    VkSampleCountFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkSampleCountFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkSampleCountFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let _1 = Self(rawValue: 1 << 0)
public static let _2 = Self(rawValue: 1 << 1)
public static let _4 = Self(rawValue: 1 << 2)
public static let _8 = Self(rawValue: 1 << 3)
public static let _16 = Self(rawValue: 1 << 4)
public static let _32 = Self(rawValue: 1 << 5)
public static let _64 = Self(rawValue: 1 << 6)
}

public struct SampleCountFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkSampleCountFlagBits {
    VkSampleCountFlagBits(rawValue)
  }

  public static let _1 = Self(rawValue: 1 << 0)
public static let _2 = Self(rawValue: 1 << 1)
public static let _4 = Self(rawValue: 1 << 2)
public static let _8 = Self(rawValue: 1 << 3)
public static let _16 = Self(rawValue: 1 << 4)
public static let _32 = Self(rawValue: 1 << 5)
public static let _64 = Self(rawValue: 1 << 6)
}