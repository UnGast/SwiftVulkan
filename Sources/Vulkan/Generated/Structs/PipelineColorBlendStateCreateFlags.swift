public struct PipelineColorBlendStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineColorBlendStateCreateFlags {
    VkPipelineColorBlendStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static let none = Self(rawValue: 0)
}