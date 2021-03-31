import CVulkan

public struct WriteDescriptorSet: VulkanTypeWrapper {
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

  var vImageInfo: [VkDescriptorImageInfo]? = nil
var vBufferInfo: [VkDescriptorBufferInfo]? = nil

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
    mutating get {
      vImageInfo = imageInfo.vulkanArray
vBufferInfo = bufferInfo.vulkanArray
      return VkWriteDescriptorSet(
        sType: VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
pNext: nil,
dstSet: dstSet.vulkan,
dstBinding: dstBinding.vulkan,
dstArrayElement: dstArrayElement.vulkan,
descriptorCount: descriptorCount.vulkan,
descriptorType: descriptorType.vulkan,
pImageInfo: vImageInfo,
pBufferInfo: vBufferInfo,
pTexelBufferView: texelBufferView.vulkan
      )
    }
  }
}