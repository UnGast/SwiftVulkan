import CVulkan

public struct ShaderStageFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkShaderStageFlags {
    VkShaderStageFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkShaderStageFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkShaderStageFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let vertex = Self(rawValue: 1 << 0)
public static let tessellationControl = Self(rawValue: 1 << 1)
public static let tessellationEvaluation = Self(rawValue: 1 << 2)
public static let geometry = Self(rawValue: 1 << 3)
public static let fragment = Self(rawValue: 1 << 4)
public static let compute = Self(rawValue: 1 << 5)
}

public struct ShaderStageFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkShaderStageFlagBits {
    VkShaderStageFlagBits(rawValue)
  }

  public static let vertex = Self(rawValue: 1 << 0)
public static let tessellationControl = Self(rawValue: 1 << 1)
public static let tessellationEvaluation = Self(rawValue: 1 << 2)
public static let geometry = Self(rawValue: 1 << 3)
public static let fragment = Self(rawValue: 1 << 4)
public static let compute = Self(rawValue: 1 << 5)
}