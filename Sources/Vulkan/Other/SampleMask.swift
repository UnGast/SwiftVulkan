import CVulkan

public struct SampleMask: VulkanTypeWrapper {
  public var rawValue: UInt32

  public init(_ rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkSampleMask {
    mutating get {
      VkSampleMask(rawValue)
    }
  }
}