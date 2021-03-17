import CVulkan

public struct PipelineMultisampleStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineMultisampleStateCreateFlags {
    VkPipelineMultisampleStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineMultisampleStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineMultisampleStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

