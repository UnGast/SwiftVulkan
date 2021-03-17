import CVulkan

public struct PipelineColorBlendStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineColorBlendStateCreateFlags {
    VkPipelineColorBlendStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineColorBlendStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineColorBlendStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

