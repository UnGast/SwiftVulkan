import CVulkan

public struct ImageMemoryBarrier: VulkanTypeWrapper {
  public var next: Any?
/** Memory accesses from the source of the dependency to synchronize */
public var srcAccessMask: AccessFlags
/** Memory accesses from the destination of the dependency to synchronize */
public var dstAccessMask: AccessFlags
/** Current layout of the image */
public var oldLayout: ImageLayout
/** New layout to transition the image to */
public var newLayout: ImageLayout
/** Queue family to transition ownership from */
public var srcQueueFamilyIndex: UInt32
/** Queue family to transition ownership to */
public var dstQueueFamilyIndex: UInt32
/** Image to sync */
public var image: Image
/** Subresource range to sync */
public var subresourceRange: ImageSubresourceRange

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
srcAccessMask: AccessFlags,
dstAccessMask: AccessFlags,
oldLayout: ImageLayout,
newLayout: ImageLayout,
srcQueueFamilyIndex: UInt32,
dstQueueFamilyIndex: UInt32,
image: Image,
subresourceRange: ImageSubresourceRange
  ) {
    self.next = next
self.srcAccessMask = srcAccessMask
self.dstAccessMask = dstAccessMask
self.oldLayout = oldLayout
self.newLayout = newLayout
self.srcQueueFamilyIndex = srcQueueFamilyIndex
self.dstQueueFamilyIndex = dstQueueFamilyIndex
self.image = image
self.subresourceRange = subresourceRange
  }

  public var vulkan: VkImageMemoryBarrier {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkImageMemoryBarrier(
        sType: VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
pNext: vNext,
srcAccessMask: srcAccessMask.vulkan,
dstAccessMask: dstAccessMask.vulkan,
oldLayout: oldLayout.vulkan,
newLayout: newLayout.vulkan,
srcQueueFamilyIndex: srcQueueFamilyIndex.vulkan,
dstQueueFamilyIndex: dstQueueFamilyIndex.vulkan,
image: image.vulkan,
subresourceRange: subresourceRange.vulkan
      )
    }
  }
}