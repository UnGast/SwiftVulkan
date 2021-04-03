import CVulkan

public struct EventCreateInfo: VulkanTypeWrapper {
  /** Event creation flags */
public var flags: EventCreateFlags?

  

  public init(
    flags: EventCreateFlags? = nil
  ) {
    self.flags = flags
  }

  public var vulkan: VkEventCreateInfo {
    mutating get {
      
      return VkEventCreateInfo(
        sType: VK_STRUCTURE_TYPE_EVENT_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0
      )
    }
  }
}