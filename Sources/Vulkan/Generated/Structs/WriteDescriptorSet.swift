import CVulkan

public struct WriteDescriptorSet: WrapperStruct {
  /** Destination descriptor set */
public var dstSet: DescriptorSet
/** Binding within the destination descriptor set to write */
public var dstBinding: UInt32
/** Array element within the destination binding to write */
public var dstArrayElement: UInt32
public var descriptorCount: UInt32
/** Descriptor type to write (determines which members of the array pointed by pDescriptors are going to be used) */
public var descriptorType: DescriptorType
public var imageInfo: [DescriptorImageInfo]
public var bufferInfo: [DescriptorBufferInfo]
public var texelBufferView: [BufferView]

  public init(
    dstSet: DescriptorSet,
dstBinding: UInt32,
dstArrayElement: UInt32,
descriptorCount: UInt32,
descriptorType: DescriptorType,
imageInfo: [DescriptorImageInfo],
bufferInfo: [DescriptorBufferInfo],
texelBufferView: [BufferView]
  ) {
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
    VkWriteDescriptorSet(
      sType: VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
pNext: nil,
dstSet: dstSet.vulkan,
dstBinding: dstBinding.vulkan,
dstArrayElement: dstArrayElement.vulkan,
descriptorCount: descriptorCount,
descriptorType: descriptorType.vulkan,
pImageInfo: imageInfo.vulkanPointer,
pBufferInfo: bufferInfo.vulkanPointer,
pTexelBufferView: texelBufferView.vulkanPointer
    )
  }
}