import CVulkan

public struct AccessFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkAccessFlags {
    VkAccessFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static let indirectCommandRead = Self(rawValue: 1 << 0)
public static let indexRead = Self(rawValue: 1 << 1)
public static let vertexAttributeRead = Self(rawValue: 1 << 2)
public static let uniformRead = Self(rawValue: 1 << 3)
public static let inputAttachmentRead = Self(rawValue: 1 << 4)
public static let shaderRead = Self(rawValue: 1 << 5)
public static let shaderWrite = Self(rawValue: 1 << 6)
public static let colorAttachmentRead = Self(rawValue: 1 << 7)
public static let colorAttachmentWrite = Self(rawValue: 1 << 8)
public static let depthStencilAttachmentRead = Self(rawValue: 1 << 9)
public static let depthStencilAttachmentWrite = Self(rawValue: 1 << 10)
public static let transferRead = Self(rawValue: 1 << 11)
public static let transferWrite = Self(rawValue: 1 << 12)
public static let hostRead = Self(rawValue: 1 << 13)
public static let hostWrite = Self(rawValue: 1 << 14)
public static let memoryRead = Self(rawValue: 1 << 15)
public static let memoryWrite = Self(rawValue: 1 << 16)
}