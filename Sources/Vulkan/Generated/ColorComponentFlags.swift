import CVulkan

public struct ColorComponentFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkColorComponentFlags {
    VkColorComponentFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static let r = Self(rawValue: 1 << 0)
public static let g = Self(rawValue: 1 << 1)
public static let b = Self(rawValue: 1 << 2)
public static let a = Self(rawValue: 1 << 3)
}