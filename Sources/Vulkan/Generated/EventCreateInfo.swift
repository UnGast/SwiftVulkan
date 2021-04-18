import CVulkan

public struct EventCreateInfo: VulkanTypeWrapper {
  public var next: Any?
/** Event creation flags */
public var flags: EventCreateFlags?

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: EventCreateFlags? = nil
  ) {
    self.next = next
self.flags = flags
  }

  public var vulkan: VkEventCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkEventCreateInfo(
        sType: VK_STRUCTURE_TYPE_EVENT_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0
      )
    }
  }
}