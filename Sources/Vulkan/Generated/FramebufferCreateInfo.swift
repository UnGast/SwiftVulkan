import CVulkan

public struct FramebufferCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: FramebufferCreateFlags?
public var renderPass: RenderPass
public var attachments: [ImageView]
public var width: UInt32
public var height: UInt32
public var layers: UInt32

  var vNext: [Any]? = nil
var vAttachments: [VkImageView?]? = nil

  public init(
    next: Any? = nil,
flags: FramebufferCreateFlags? = nil,
renderPass: RenderPass,
attachments: [ImageView],
width: UInt32,
height: UInt32,
layers: UInt32
  ) {
    self.next = next
self.flags = flags
self.renderPass = renderPass
self.attachments = attachments
self.width = width
self.height = height
self.layers = layers
  }

  public var vulkan: VkFramebufferCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vAttachments = attachments.vulkanArray
      return VkFramebufferCreateInfo(
        sType: VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
renderPass: renderPass.vulkan,
attachmentCount: UInt32(attachments.count),
pAttachments: vAttachments,
width: width.vulkan,
height: height.vulkan,
layers: layers.vulkan
      )
    }
  }
}