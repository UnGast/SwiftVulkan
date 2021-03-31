import CVulkan

public struct DescriptorSetAllocateInfo: VulkanTypeWrapper {
  public var descriptorPool: DescriptorPool
public var descriptorSetCount: UInt32
public var setLayouts: [DescriptorSetLayout]

  var vSetLayouts: [VkDescriptorSetLayout?]? = nil

  public init(
    descriptorPool: DescriptorPool,
descriptorSetCount: UInt32,
setLayouts: [DescriptorSetLayout]
  ) {
    self.descriptorPool = descriptorPool
self.descriptorSetCount = descriptorSetCount
self.setLayouts = setLayouts
  }

  public var vulkan: VkDescriptorSetAllocateInfo {
    mutating get {
      vSetLayouts = setLayouts.vulkanArray
      return VkDescriptorSetAllocateInfo(
        sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
pNext: nil,
descriptorPool: descriptorPool.vulkan,
descriptorSetCount: descriptorSetCount.vulkan,
pSetLayouts: vSetLayouts
      )
    }
  }
}