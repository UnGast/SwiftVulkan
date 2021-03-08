import CVulkan

public class SubpassDescription: WrapperStruct {
    public let flags: SubpassDescriptionFlags
    public let pipelineBindPoint: PipelineBindPoint
    public let inputAttachments: [AttachmentReference]?
    public let colorAttachments: [AttachmentReference]?
    public let resolveAttachments: [AttachmentReference]?
    public let depthStencilAttachment: AttachmentReference?
    public let preserveAttachments: [UInt32]?

    public init(flags: SubpassDescriptionFlags,
                pipelineBindPoint: PipelineBindPoint,
                inputAttachments: [AttachmentReference]?,
                colorAttachments: [AttachmentReference]?,
                resolveAttachments: [AttachmentReference]?,
                depthStencilAttachment: AttachmentReference?,
                preserveAttachments: [UInt32]?) {
        self.flags = flags
        self.pipelineBindPoint = pipelineBindPoint
        self.inputAttachments = inputAttachments
        self.colorAttachments = colorAttachments
        self.resolveAttachments = resolveAttachments
        self.depthStencilAttachment = depthStencilAttachment
        self.preserveAttachments = preserveAttachments
    }

    public var vulkan: VkSubpassDescription {
        VkSubpassDescription(
                flags: self.flags.rawValue,
                pipelineBindPoint: self.pipelineBindPoint.vulkan,
                inputAttachmentCount: UInt32(self.inputAttachments?.count ?? 0),
                pInputAttachments: inputAttachments?.vulkanPointer,
                colorAttachmentCount: UInt32(self.colorAttachments?.count ?? 0),
                pColorAttachments: colorAttachments?.vulkanPointer,
                pResolveAttachments: resolveAttachments?.vulkanPointer,
                pDepthStencilAttachment: depthStencilAttachment?.vulkanPointer,
                preserveAttachmentCount: UInt32(self.preserveAttachments?.count ?? 0),
                pPreserveAttachments: preserveAttachments?.vulkanPointer
        )
    }
}

