import CVulkan

public class Framebuffer: VulkanHandleTypeWrapper {

  public let pointer: VkFramebuffer
  public let device: Device

  init(rawFramebuffer: VkFramebuffer, device: Device) {
    self.pointer = rawFramebuffer
    self.device = device
  }

  public convenience init(device: Device, createInfo: FramebufferCreateInfo) throws {
    var createInfo = createInfo

    var rawFramebuffer = VkFramebuffer(bitPattern: 0)
    
    var opResult = VK_ERROR_INITIALIZATION_FAILED
    withUnsafePointer(to: createInfo.vulkan) {
      opResult = vkCreateFramebuffer(device.pointer, $0, nil, &rawFramebuffer)
    }

    if opResult == VK_SUCCESS {
      self.init(rawFramebuffer: rawFramebuffer!, device: device)
      return
    }

    throw opResult.toResult()
  }

  public var vulkan: Optional<VkFramebuffer> {
    pointer
  }

  override public func destroyUnderlying() {
    vkDestroyFramebuffer(device.pointer, self.pointer, nil)
  }
}
