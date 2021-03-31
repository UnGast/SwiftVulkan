import CVulkan

public struct DescriptorPoolSize: VulkanTypeWrapper {
  public var type: DescriptorType
public var descriptorCount: UInt32

  

  public init(
    type: DescriptorType,
descriptorCount: UInt32
  ) {
    self.type = type
self.descriptorCount = descriptorCount
  }

  public var vulkan: VkDescriptorPoolSize {
    mutating get {
      
      return VkDescriptorPoolSize(
        type: type.vulkan,
descriptorCount: descriptorCount.vulkan
      )
    }
  }
}