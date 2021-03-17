import CVulkan

public struct PipelineViewportStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineViewportStateCreateFlags {
    VkPipelineViewportStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineViewportStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineViewportStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

