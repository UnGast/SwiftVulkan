import CVulkan

public struct MemoryBarrier: VulkanTypeWrapper {
  /** Memory accesses from the source of the dependency to synchronize */
public var srcAccessMask: AccessFlags?
/** Memory accesses from the destination of the dependency to synchronize */
public var dstAccessMask: AccessFlags?

  

  public init(
    srcAccessMask: AccessFlags? = nil,
dstAccessMask: AccessFlags? = nil
  ) {
    self.srcAccessMask = srcAccessMask
self.dstAccessMask = dstAccessMask
  }

  public var vulkan: VkMemoryBarrier {
    mutating get {
      
      return VkMemoryBarrier(
        sType: VK_STRUCTURE_TYPE_MEMORY_BARRIER,
pNext: nil,
srcAccessMask: srcAccessMask?.vulkan ?? 0,
dstAccessMask: dstAccessMask?.vulkan ?? 0
      )
    }
  }
}