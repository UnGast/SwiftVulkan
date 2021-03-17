import CVulkan

public struct PipelineTessellationStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineTessellationStateCreateFlags {
    VkPipelineTessellationStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineTessellationStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineTessellationStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

