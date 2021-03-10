import CVulkan

public struct FramebufferCreateInfo: WrapperStruct {
  public let flags: Flags
  public let renderPass: RenderPass
  public let attachments: [ImageView]
  public let width: UInt32
  public let height: UInt32
  public let layers: UInt32

  public init(
    flags: Flags,
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
      flags: flags.rawValue,
      renderPass: renderPass.pointer,
      attachmentCount: UInt32(attachments.count),
      pAttachments: attachments.vulkanPointer,
      width: width,
      height: height,
      layers: layers
    )
  }

  public struct Flags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = Flags(rawValue: 0)
    public static let imageless = Flags(rawValue: 0x00000001)
    public static let imagelessKhr = Flags(rawValue: 0x00000001)
  }
}