import CVulkan

public enum IndexType: UInt32, VulkanEnumTypeWrapper {
  case uint16 = 0,
uint32 = 1

  public init(fromVulkan: VkIndexType) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkIndexType {
    VkIndexType(rawValue)
  }
}