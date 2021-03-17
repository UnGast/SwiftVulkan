import CVulkan

public struct PipelineShaderStageCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineShaderStageCreateFlags {
    VkPipelineShaderStageCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineShaderStageCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineShaderStageCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

public struct PipelineShaderStageCreateFlagBits: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkPipelineShaderStageCreateFlagBits {
    VkPipelineShaderStageCreateFlagBits(rawValue)
  }

  
}