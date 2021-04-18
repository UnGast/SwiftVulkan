import CVulkan

public class Event: VulkanHandleTypeWrapper, VulkanTypeWrapper {
    public let pointer: VkEvent
    public let device: Device

    init(device: Device, pointer: VkEvent) {
        self.pointer = pointer 
        self.device = device
    }

    public var vulkan: Optional<VkEvent> {
      pointer
    }

    public convenience init(device: Device, createInfo: EventCreateInfo) throws {
      var createInfo = createInfo
      var pointer: VkEvent?

      let opResult = withUnsafePointer(to: createInfo.vulkan) {
        return vkCreateEvent(device.pointer, $0, nil, &pointer)
      }

      guard opResult == VK_SUCCESS else {
        throw opResult.toResult()
      }

      self.init(device: device, pointer: pointer!)
    }

    public var status: Result {
      vkGetEventStatus(device.pointer, pointer).toResult()
    }

    public override func destroyUnderlying() {
      vkDestroyEvent(device.pointer, pointer, nil)
    }
}