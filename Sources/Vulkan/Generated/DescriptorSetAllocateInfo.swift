import CVulkan

public struct DescriptorSetAllocateInfo: VulkanTypeWrapper {
  public var next: Any?
public var descriptorPool: DescriptorPool
public var descriptorSetCount: UInt32
public var setLayouts: [DescriptorSetLayout]

  var vNext: [Any]? = nil
var vSetLayouts: [VkDescriptorSetLayout?]? = nil

  public init(
    next: Any? = nil,
descriptorPool: DescriptorPool,
descriptorSetCount: UInt32,
setLayouts: [DescriptorSetLayout]
  ) {
    self.next = next
self.descriptorPool = descriptorPool
self.descriptorSetCount = descriptorSetCount
self.setLayouts = setLayouts
  }

  public var vulkan: VkDescriptorSetAllocateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vSetLayouts = Optional(setLayouts.vulkanArray)
      return VkDescriptorSetAllocateInfo(
        sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
pNext: vNext,
descriptorPool: descriptorPool.vulkan,
descriptorSetCount: descriptorSetCount.vulkan,
pSetLayouts: vSetLayouts
      )
    }
  }
}