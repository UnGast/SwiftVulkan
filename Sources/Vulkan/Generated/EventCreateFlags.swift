import CVulkan

public struct EventCreateFlags: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkEventCreateFlags {
    VkEventCreateFlags(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkEventCreateFlags) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkEventCreateFlags?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  
}

