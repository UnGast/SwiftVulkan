import CVulkan

public struct MemoryBarrier: VulkanTypeWrapper {
  public var next: Any?
/** Memory accesses from the source of the dependency to synchronize */
public var srcAccessMask: AccessFlags?
/** Memory accesses from the destination of the dependency to synchronize */
public var dstAccessMask: AccessFlags?

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
srcAccessMask: AccessFlags? = nil,
dstAccessMask: AccessFlags? = nil
  ) {
    self.next = next
self.srcAccessMask = srcAccessMask
self.dstAccessMask = dstAccessMask
  }

  public var vulkan: VkMemoryBarrier {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkMemoryBarrier(
        sType: VK_STRUCTURE_TYPE_MEMORY_BARRIER,
pNext: vNext,
srcAccessMask: srcAccessMask?.vulkan ?? 0,
dstAccessMask: dstAccessMask?.vulkan ?? 0
      )
    }
  }
}