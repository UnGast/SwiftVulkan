import CVulkan

public struct DescriptorSetLayoutCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: DescriptorSetLayoutCreateFlags?
public var bindings: [DescriptorSetLayoutBinding]

  var vNext: [Any]? = nil
var vBindings: [VkDescriptorSetLayoutBinding]? = nil

  public init(
    next: Any? = nil,
flags: DescriptorSetLayoutCreateFlags? = nil,
bindings: [DescriptorSetLayoutBinding]
  ) {
    self.next = next
self.flags = flags
self.bindings = bindings
  }

  public var vulkan: VkDescriptorSetLayoutCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vBindings = bindings.vulkanArray
      return VkDescriptorSetLayoutCreateInfo(
        sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
bindingCount: UInt32(bindings.count),
pBindings: vBindings
      )
    }
  }
}