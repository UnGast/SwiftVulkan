import CVulkan

public struct BufferMemoryBarrier: VulkanTypeWrapper {
  /** Memory accesses from the source of the dependency to synchronize */
public var srcAccessMask: AccessFlags
/** Memory accesses from the destination of the dependency to synchronize */
public var dstAccessMask: AccessFlags
/** Queue family to transition ownership from */
public var srcQueueFamilyIndex: UInt32
/** Queue family to transition ownership to */
public var dstQueueFamilyIndex: UInt32
/** Buffer to sync */
public var buffer: Buffer
/** Offset within the buffer to sync */
public var offset: DeviceSize
/** Amount of bytes to sync */
public var size: DeviceSize

  

  public init(
    srcAccessMask: AccessFlags,
dstAccessMask: AccessFlags,
srcQueueFamilyIndex: UInt32,
dstQueueFamilyIndex: UInt32,
buffer: Buffer,
offset: DeviceSize,
size: DeviceSize
  ) {
    self.srcAccessMask = srcAccessMask
self.dstAccessMask = dstAccessMask
self.srcQueueFamilyIndex = srcQueueFamilyIndex
self.dstQueueFamilyIndex = dstQueueFamilyIndex
self.buffer = buffer
self.offset = offset
self.size = size
  }

  public var vulkan: VkBufferMemoryBarrier {
    mutating get {
      
      return VkBufferMemoryBarrier(
        sType: VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER,
pNext: nil,
srcAccessMask: srcAccessMask.vulkan,
dstAccessMask: dstAccessMask.vulkan,
srcQueueFamilyIndex: srcQueueFamilyIndex.vulkan,
dstQueueFamilyIndex: dstQueueFamilyIndex.vulkan,
buffer: buffer.vulkan,
offset: offset.vulkan,
size: size.vulkan
      )
    }
  }
}