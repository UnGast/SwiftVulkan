import CVulkan

public struct BufferCopy: WrapperStruct {
  /** Specified in bytes */
public var srcOffset: DeviceSize
/** Specified in bytes */
public var dstOffset: DeviceSize
/** Specified in bytes */
public var size: DeviceSize

  public init(
    srcOffset: DeviceSize,
dstOffset: DeviceSize,
size: DeviceSize
  ) {
    self.srcOffset = srcOffset
self.dstOffset = dstOffset
self.size = size
  }

  public var vulkan: VkBufferCopy {
    VkBufferCopy(
      srcOffset: srcOffset.vulkan,
dstOffset: dstOffset.vulkan,
size: size.vulkan
    )
  }
}