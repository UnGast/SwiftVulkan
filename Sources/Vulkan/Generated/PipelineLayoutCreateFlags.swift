import CVulkan

public struct PipelineLayoutCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineLayoutCreateFlags {
    VkPipelineLayoutCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineLayoutCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineLayoutCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

