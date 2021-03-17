import CVulkan

public struct CullModeFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkCullModeFlags {
    VkCullModeFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkCullModeFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkCullModeFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let front = Self(rawValue: 1 << 0)
public static let back = Self(rawValue: 1 << 1)
}

public struct CullModeFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkCullModeFlagBits {
    VkCullModeFlagBits(rawValue)
  }

  public static let front = Self(rawValue: 1 << 0)
public static let back = Self(rawValue: 1 << 1)
}