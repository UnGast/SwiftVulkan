import CVulkan

public struct PipelineVertexInputStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineVertexInputStateCreateFlags {
    VkPipelineVertexInputStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineVertexInputStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineVertexInputStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

