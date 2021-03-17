import CVulkan

public struct PipelineDynamicStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineDynamicStateCreateFlags {
    VkPipelineDynamicStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineDynamicStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineDynamicStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

