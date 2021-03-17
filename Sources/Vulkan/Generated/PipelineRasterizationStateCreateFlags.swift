import CVulkan

public struct PipelineRasterizationStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineRasterizationStateCreateFlags {
    VkPipelineRasterizationStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineRasterizationStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineRasterizationStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

