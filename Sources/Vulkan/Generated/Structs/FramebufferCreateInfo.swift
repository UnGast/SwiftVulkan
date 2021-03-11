import CVulkan

public struct FramebufferCreateInfo: WrapperStruct {
  public var flags: FramebufferCreateFlags
public var renderPass: RenderPass
public var attachments: [ImageView]
public var width: UInt32
public var height: UInt32
public var layers: UInt32

  public init(
    flags: FramebufferCreateFlags,
renderPass: RenderPass,
attachments: [ImageView],
width: UInt32,
height: UInt32,
layers: UInt32
  ) {
    self.flags = flags
self.renderPass = renderPass
self.attachments = attachments
self.width = width
self.height = height
self.layers = layers
  }

  public var vulkan: VkFramebufferCreateInfo {
    VkFramebufferCreateInfo(
      sType: VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO,
pNext: nil,
flags: flags.vulkan,
renderPass: renderPass.vulkan,
attachmentCount: UInt32(attachments.count),
pAttachments: attachments.vulkanPointer,
width: width,
height: height,
layers: layers
    )
  }
}