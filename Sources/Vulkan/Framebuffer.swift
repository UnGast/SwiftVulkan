import CVulkan

public class Framebuffer {

  public let pointer: VkFramebuffer

  init(rawFramebuffer: VkFramebuffer) {
    self.pointer = rawFramebuffer
  }

  public convenience init(device: Device, createInfo: FramebufferCreateInfo) throws {
    var rawFramebuffer = VkFramebuffer(bitPattern: 0)
    var opResult = VK_ERROR_INITIALIZATION_FAILED
    withUnsafePointer(to: createInfo.vulkan) {
      opResult = vkCreateFramebuffer(device.pointer, $0, nil, &rawFramebuffer)
    }

    if opResult == VK_SUCCESS {
      self.init(rawFramebuffer: rawFramebuffer!)
      return
    }

    throw opResult.toResult()
  }
}
