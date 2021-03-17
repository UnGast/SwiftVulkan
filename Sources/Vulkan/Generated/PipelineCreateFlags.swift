import CVulkan

public struct PipelineCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineCreateFlags {
    VkPipelineCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let disableOptimization = Self(rawValue: 1 << 0)
public static let allowDerivatives = Self(rawValue: 1 << 1)
public static let derivative = Self(rawValue: 1 << 2)
}

public struct PipelineCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkPipelineCreateFlagBits {
    VkPipelineCreateFlagBits(rawValue)
  }

  public static let disableOptimization = Self(rawValue: 1 << 0)
public static let allowDerivatives = Self(rawValue: 1 << 1)
public static let derivative = Self(rawValue: 1 << 2)
}