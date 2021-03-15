import CVulkan

public struct BufferImageCopy: VulkanTypeWrapper {
  /** Specified in bytes */
public var bufferOffset: DeviceSize
/** Specified in texels */
public var bufferRowLength: UInt32
public var bufferImageHeight: UInt32
public var imageSubresource: ImageSubresourceLayers
/** Specified in pixels for both compressed and uncompressed images */
public var imageOffset: Offset3D
/** Specified in pixels for both compressed and uncompressed images */
public var imageExtent: Extent3D

  

  public init(
    bufferOffset: DeviceSize,
bufferRowLength: UInt32,
bufferImageHeight: UInt32,
imageSubresource: ImageSubresourceLayers,
imageOffset: Offset3D,
imageExtent: Extent3D
  ) {
    self.bufferOffset = bufferOffset
self.bufferRowLength = bufferRowLength
self.bufferImageHeight = bufferImageHeight
self.imageSubresource = imageSubresource
self.imageOffset = imageOffset
self.imageExtent = imageExtent
  }

  public var vulkan: VkBufferImageCopy {
    mutating get {
      
      return VkBufferImageCopy(
        bufferOffset: bufferOffset.vulkan,
bufferRowLength: bufferRowLength.vulkan,
bufferImageHeight: bufferImageHeight.vulkan,
imageSubresource: imageSubresource.vulkan,
imageOffset: imageOffset.vulkan,
imageExtent: imageExtent.vulkan
      )
    }
  }
}