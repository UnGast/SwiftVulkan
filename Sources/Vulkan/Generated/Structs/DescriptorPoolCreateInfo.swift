import CVulkan

public struct DescriptorPoolCreateInfo: WrapperStruct {
  public var flags: DescriptorPoolCreateFlags
public var maxSets: UInt32
public var poolSizes: [DescriptorPoolSize]

  public init(
    flags: DescriptorPoolCreateFlags,
maxSets: UInt32,
poolSizes: [DescriptorPoolSize]
  ) {
    self.flags = flags
self.maxSets = maxSets
self.poolSizes = poolSizes
  }

  public var vulkan: VkDescriptorPoolCreateInfo {
    VkDescriptorPoolCreateInfo(
      sType: VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
pNext: nil,
flags: flags.vulkan,
maxSets: maxSets.vulkan,
poolSizeCount: UInt32(poolSizes.count),
pPoolSizes: poolSizes.vulkanPointer
    )
  }
}