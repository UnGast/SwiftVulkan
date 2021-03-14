import CVulkan

public struct PipelineCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineCreateFlags {
    VkPipelineCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static let none = Self(rawValue: 0)
  public static let disableOptimization = Self(rawValue: 0)
public static let allowDerivatives = Self(rawValue: 1)
public static let derivative = Self(rawValue: 2)
}