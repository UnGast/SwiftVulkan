import CVulkan

public struct DescriptorSetAllocateInfo: WrapperStruct {
  public var descriptorPool: DescriptorPool
public var descriptorSetCount: UInt32
public var setLayouts: [DescriptorSetLayout]

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
    VkDescriptorSetAllocateInfo(
      sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
pNext: nil,
descriptorPool: descriptorPool.pointer,
descriptorSetCount: descriptorSetCount,
pSetLayouts: setLayouts.vulkanPointer
    )
  }
}