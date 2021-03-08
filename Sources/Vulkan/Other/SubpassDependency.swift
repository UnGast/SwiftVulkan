import CVulkan

public struct SubpassDependency: WrapperStruct {
    public let srcSubpass: UInt32
    public let dstSubpass: UInt32
    public let srcStageMask: PipelineStageFlags
    public let dstStageMask: PipelineStageFlags
    public let srcAccessMask: AccessFlags
    public let dstAccessMask: AccessFlags
    public let dependencyFlags: DependencyFlags

    public init(srcSubpass: UInt32,
                dstSubpass: UInt32,
                srcStageMask: PipelineStageFlags,
                dstStageMask: PipelineStageFlags,
                srcAccessMask: AccessFlags,
                dstAccessMask: AccessFlags,
                dependencyFlags: DependencyFlags) {
        self.srcSubpass = srcSubpass
        self.dstSubpass = dstSubpass
        self.srcStageMask = srcStageMask
        self.dstStageMask = dstStageMask
        self.srcAccessMask = srcAccessMask
        self.dstAccessMask = dstAccessMask
        self.dependencyFlags = dependencyFlags
    }

    public var vulkan: VkSubpassDependency {
        return VkSubpassDependency(
                srcSubpass: self.srcSubpass,
                dstSubpass: self.dstSubpass,
                srcStageMask: self.srcStageMask.rawValue,
                dstStageMask: self.dstStageMask.rawValue,
                srcAccessMask: self.srcAccessMask.rawValue,
                dstAccessMask: self.dstAccessMask.rawValue,
                dependencyFlags: self.dependencyFlags.rawValue
        )
    }
}