import CVulkan

public struct DescriptorSetLayoutCreateInfo: VulkanTypeWrapper {
  public var flags: DescriptorSetLayoutCreateFlags?
public var bindings: [DescriptorSetLayoutBinding]

  var vBindings: [VkDescriptorSetLayoutBinding]? = nil

  public init(
    flags: DescriptorSetLayoutCreateFlags? = nil,
bindings: [DescriptorSetLayoutBinding]
  ) {
    self.flags = flags
self.bindings = bindings
  }

  public var vulkan: VkDescriptorSetLayoutCreateInfo {
    mutating get {
      vBindings = bindings.vulkanArray
      return VkDescriptorSetLayoutCreateInfo(
        sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
bindingCount: UInt32(bindings.count),
pBindings: vBindings
      )
    }
  }
}