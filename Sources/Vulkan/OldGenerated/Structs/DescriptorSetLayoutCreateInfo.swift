import CVulkan

public struct DescriptorSetLayoutCreateInfo: WrapperStruct {
  public var flags: DescriptorSetLayoutCreateFlags
public var bindings: [DescriptorSetLayoutBinding]

  public init(
    flags: DescriptorSetLayoutCreateFlags,
bindings: [DescriptorSetLayoutBinding]
  ) {
    self.flags = flags
self.bindings = bindings
  }

  public var vulkan: VkDescriptorSetLayoutCreateInfo {
    VkDescriptorSetLayoutCreateInfo(
      sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
pNext: nil,
flags: flags.vulkan,
bindingCount: UInt32(bindings.count),
pBindings: bindings.vulkanPointer
    )
  }
}