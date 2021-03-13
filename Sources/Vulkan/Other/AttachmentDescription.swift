import CVulkan

public struct AttachmentDescription: WrapperStruct {
    public var flags: AttachmentDescriptionFlags
    public var format: Format
    public var samples: SampleCountFlags
    public var loadOp: AttachmentLoadOp
    public var storeOp: AttachmentStoreOp
    public var stencilLoadOp: AttachmentLoadOp
    public var stencilStoreOp: AttachmentStoreOp
    public var initialLayout: ImageLayout
    public var finalLayout: ImageLayout

    public init(flags: AttachmentDescriptionFlags,
                format: Format,
                samples: SampleCountFlags,
                loadOp: AttachmentLoadOp,
                storeOp: AttachmentStoreOp,
                stencilLoadOp: AttachmentLoadOp,
                stencilStoreOp: AttachmentStoreOp,
                initialLayout: ImageLayout,
                finalLayout: ImageLayout) {
        self.flags = flags
        self.format = format
        self.samples = samples
        self.loadOp = loadOp
        self.storeOp = storeOp
        self.stencilLoadOp = stencilLoadOp
        self.stencilStoreOp = stencilStoreOp
        self.initialLayout = initialLayout
        self.finalLayout = finalLayout
    }

    public var vulkan: VkAttachmentDescription {
        return VkAttachmentDescription(
                flags: self.flags.vulkanValue,
                format: self.format.vulkan,
                samples: self.samples.vulkanValue,
                loadOp: self.loadOp.vulkanValue,
                storeOp: self.storeOp.vulkanValue,
                stencilLoadOp: self.stencilLoadOp.vulkanValue,
                stencilStoreOp: self.stencilStoreOp.vulkanValue,
                initialLayout: self.initialLayout.vulkan,
                finalLayout: self.finalLayout.vulkan
        )
    }
}

