import CVulkan

public struct DescriptorPoolCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: DescriptorPoolCreateFlags?
public var maxSets: UInt32
public var poolSizes: [DescriptorPoolSize]

  var vNext: [Any]? = nil
var vPoolSizes: [VkDescriptorPoolSize]? = nil

  public init(
    next: Any? = nil,
flags: DescriptorPoolCreateFlags? = nil,
maxSets: UInt32,
poolSizes: [DescriptorPoolSize]
  ) {
    self.next = next
self.flags = flags
self.maxSets = maxSets
self.poolSizes = poolSizes
  }

  public var vulkan: VkDescriptorPoolCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vPoolSizes = poolSizes.vulkanArray
      return VkDescriptorPoolCreateInfo(
        sType: VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
maxSets: maxSets.vulkan,
poolSizeCount: UInt32(poolSizes.count),
pPoolSizes: vPoolSizes
      )
    }
  }
}