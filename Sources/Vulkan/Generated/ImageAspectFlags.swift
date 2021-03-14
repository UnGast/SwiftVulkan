import CVulkan

public struct ImageAspectFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkImageAspectFlags {
    VkImageAspectFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static let color = Self(rawValue: 1 << 0)
public static let depth = Self(rawValue: 1 << 1)
public static let stencil = Self(rawValue: 1 << 2)
public static let metadata = Self(rawValue: 1 << 3)
}