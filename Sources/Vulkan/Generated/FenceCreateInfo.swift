import CVulkan

public struct FenceCreateInfo: VulkanTypeWrapper {
  public var next: Any?
/** Fence creation flags */
public var flags: FenceCreateFlags?

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: FenceCreateFlags? = nil
  ) {
    self.next = next
self.flags = flags
  }

  public var vulkan: VkFenceCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkFenceCreateInfo(
        sType: VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0
      )
    }
  }
}