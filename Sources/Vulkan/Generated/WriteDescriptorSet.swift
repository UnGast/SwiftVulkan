import CVulkan

public struct WriteDescriptorSet: VulkanTypeWrapper {
  public var next: Any?
/** Destination descriptor set */
public var dstSet: DescriptorSet
/** Binding within the destination descriptor set to write */
public var dstBinding: UInt32
/** Array element within the destination binding to write */
public var dstArrayElement: UInt32
/** Number of descriptors to write (determines the size of the array pointed by pDescriptors) */
public var descriptorCount: UInt32
/** Descriptor type to write (determines which members of the array pointed by pDescriptors are going to be used) */
public var descriptorType: DescriptorType
public var imageInfo: [DescriptorImageInfo]
public var bufferInfo: [DescriptorBufferInfo]
public var texelBufferView: [BufferView]

  var vNext: [Any]? = nil
var vImageInfo: [VkDescriptorImageInfo]? = nil
var vBufferInfo: [VkDescriptorBufferInfo]? = nil
var vTexelBufferView: [VkBufferView?]? = nil

  public init(
    next: Any? = nil,
dstSet: DescriptorSet,
dstBinding: UInt32,
dstArrayElement: UInt32,
descriptorCount: UInt32,
descriptorType: DescriptorType,
imageInfo: [DescriptorImageInfo],
bufferInfo: [DescriptorBufferInfo],
texelBufferView: [BufferView]
  ) {
    self.next = next
self.dstSet = dstSet
self.dstBinding = dstBinding
self.dstArrayElement = dstArrayElement
self.descriptorCount = descriptorCount
self.descriptorType = descriptorType
self.imageInfo = imageInfo
self.bufferInfo = bufferInfo
self.texelBufferView = texelBufferView
  }

  public var vulkan: VkWriteDescriptorSet {
    mutating get {
      vNext = next == nil ? nil : [next!]
vImageInfo = imageInfo.vulkanArray
vBufferInfo = bufferInfo.vulkanArray
vTexelBufferView = texelBufferView.vulkanArray
      return VkWriteDescriptorSet(
        sType: VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
pNext: vNext,
dstSet: dstSet.vulkan,
dstBinding: dstBinding.vulkan,
dstArrayElement: dstArrayElement.vulkan,
descriptorCount: descriptorCount.vulkan,
descriptorType: descriptorType.vulkan,
pImageInfo: vImageInfo,
pBufferInfo: vBufferInfo,
pTexelBufferView: vTexelBufferView
      )
    }
  }
}