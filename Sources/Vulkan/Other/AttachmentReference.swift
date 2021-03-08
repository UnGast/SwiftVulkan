import CVulkan

public struct AttachmentReference: WrapperStruct {
    public let attachment: UInt32
    public let layout: ImageLayout

    public init(attachment: UInt32, layout: ImageLayout) {
        self.attachment = attachment
        self.layout = layout
    }

    public var vulkan: VkAttachmentReference {
        VkAttachmentReference(attachment: self.attachment, layout: self.layout.vulkanValue)
    }
}

