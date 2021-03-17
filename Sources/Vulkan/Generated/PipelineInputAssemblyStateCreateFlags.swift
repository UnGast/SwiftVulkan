import CVulkan

public struct PipelineInputAssemblyStateCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkPipelineInputAssemblyStateCreateFlags {
    VkPipelineInputAssemblyStateCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkPipelineInputAssemblyStateCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkPipelineInputAssemblyStateCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

