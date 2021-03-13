import CVulkan

public struct DescriptorBufferInfo: WrapperStruct {
  /** Buffer used for this descriptor slot. */
public var buffer: Buffer
/** Base offset from buffer start in bytes to update in the descriptor set. */
public var offset: DeviceSize
/** Size in bytes of the buffer resource for this descriptor update. */
public var range: DeviceSize

  public init(
    buffer: Buffer,
offset: DeviceSize,
range: DeviceSize
  ) {
    self.buffer = buffer
self.offset = offset
self.range = range
  }

  public var vulkan: VkDescriptorBufferInfo {
    VkDescriptorBufferInfo(
      buffer: buffer.vulkan,
offset: offset.vulkan,
range: range.vulkan
    )
  }
}