import CVulkan

public struct PipelineDepthStencilStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineDepthStencilStateCreateFlags {
    VkPipelineDepthStencilStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineDepthStencilStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineDepthStencilStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

