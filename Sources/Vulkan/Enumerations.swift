//
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

// FLAGS ========
/*
public struct AccessFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = AccessFlags(rawValue: 0)
    public static let indirectCommandRead = AccessFlags(rawValue: 0x00000001)
    public static let indexRead = AccessFlags(rawValue: 0x00000002)
    public static let vertexAttributeRead = AccessFlags(rawValue: 0x00000004)
    public static let uniformRead = AccessFlags(rawValue: 0x00000008)
    public static let inputAttachmentRead = AccessFlags(rawValue: 0x00000010)
    public static let shaderRead = AccessFlags(rawValue: 0x00000020)
    public static let shaderWrite = AccessFlags(rawValue: 0x00000040)
    public static let colorAttachmentRead = AccessFlags(rawValue: 0x00000080)
    public static let colorAttachmentWrite = AccessFlags(rawValue: 0x00000100)
    public static let depthStencilAttachmentRead = AccessFlags(rawValue: 0x00000200)
    public static let depthStencilAttachmentWrite = AccessFlags(rawValue: 0x00000400)
    public static let transferRead = AccessFlags(rawValue: 0x00000800)
    public static let transferWrite = AccessFlags(rawValue: 0x00001000)
    public static let hostRead = AccessFlags(rawValue: 0x00002000)
    public static let hostWrite = AccessFlags(rawValue: 0x00004000)
    public static let memoryRead = AccessFlags(rawValue: 0x00008000)
    public static let memoryWrite = AccessFlags(rawValue: 0x00010000)
    public static let transformFeedbackWrite = AccessFlags(rawValue: 0x02000000)
    public static let transformFeedbackCounterRead = AccessFlags(rawValue: 0x04000000)
    public static let transformFeedbackCounterWrite = AccessFlags(rawValue: 0x08000000)
    public static let conditionalRenderingRead = AccessFlags(rawValue: 0x00100000)
    public static let commandProcessRead = AccessFlags(rawValue: 0x00020000)
    public static let commandProcessWrite = AccessFlags(rawValue: 0x00040000)
    public static let colorAttachmentReadNonCoherent = AccessFlags(rawValue: 0x00080000)
    public static let shadingRateImageRead = AccessFlags(rawValue: 0x00800000)
    public static let accelerationStructureRead = AccessFlags(rawValue: 0x00200000)
    public static let accelerationStructureWrite = AccessFlags(rawValue: 0x00400000)
    public static let fragmentDensityMapRead = AccessFlags(rawValue: 0x01000000)

    var vulkanValue: VkAccessFlagBits {
        return VkAccessFlagBits(self.rawValue)
    }
}*/

public struct AttachmentDescriptionFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = AttachmentDescriptionFlags(rawValue: 0)
    public static let mayAlias = AttachmentDescriptionFlags(rawValue: 0x00000001)

    var vulkanValue: VkAttachmentDescriptionFlags {
        return VkAttachmentDescriptionFlags(self.rawValue)
    }
}

public struct CompositeAlphaFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = CompositeAlphaFlags(rawValue: 0)
    public static let opaque = CompositeAlphaFlags(rawValue: 1 << 0)
    public static let preMultiplied = CompositeAlphaFlags(rawValue: 1 << 1)
    public static let postMultiplied = CompositeAlphaFlags(rawValue: 1 << 2)
    public static let inherit = CompositeAlphaFlags(rawValue: 1 << 3)

    var vulkan: VkCompositeAlphaFlagBitsKHR {
        return VkCompositeAlphaFlagBitsKHR(self.rawValue)
    }
}

public struct DependencyFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = DependencyFlags(rawValue: 0)
    public static let byRegion = DependencyFlags(rawValue: 0x00000001)
    public static let deviceGroup = DependencyFlags(rawValue: 0x00000004)
    public static let viewLocal = DependencyFlags(rawValue: 0x00000002)

    var vulkanValue: VkDependencyFlagBits {
        return VkDependencyFlagBits(self.rawValue)
    }
}
/*
public struct ImageAspectFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let color = ImageAspectFlags(rawValue: 1 << 0)
    public static let depth = ImageAspectFlags(rawValue: 1 << 1)
    public static let stencil = ImageAspectFlags(rawValue: 1 << 2)
    public static let metadata = ImageAspectFlags(rawValue: 1 << 3)
    public static let plane0 = ImageAspectFlags(rawValue: 1 << 4)
    public static let plane1 = ImageAspectFlags(rawValue: 1 << 5)
    public static let plane2 = ImageAspectFlags(rawValue: 1 << 6)
    public static let memoryPlane0 = ImageAspectFlags(rawValue: 1 << 7)
    public static let memoryPlane1 = ImageAspectFlags(rawValue: 1 << 8)
    public static let memoryPlane2 = ImageAspectFlags(rawValue: 1 << 9)
    public static let memoryPlane3 = ImageAspectFlags(rawValue: 1 << 10)

    var vulkan: VkImageAspectFlags {
        return VkImageAspectFlags(self.rawValue)
    }
}*/
/*
public struct ImageUsageFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let transferSrc = ImageUsageFlags(rawValue: 1 << 0)
    public static let transferDst = ImageUsageFlags(rawValue: 1 << 1)
    public static let sampled = ImageUsageFlags(rawValue: 1 << 2)
    public static let storage = ImageUsageFlags(rawValue: 1 << 3)
    public static let colorAttachment = ImageUsageFlags(rawValue: 1 << 4)
    public static let depthStencilAttachment = ImageUsageFlags(rawValue: 1 << 5)
    public static let transientAttachment = ImageUsageFlags(rawValue: 1 << 6)
    public static let inputAttachment = ImageUsageFlags(rawValue: 1 << 7)
    public static let shadingRateImage = ImageUsageFlags(rawValue: 1 << 8)

    public var vulkan: VkImageUsageFlagBits {
        return VkImageUsageFlagBits(self.rawValue)
    }
}*/

public struct FormatFeatureFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = FormatFeatureFlags(rawValue: 0)
    public static let sampledImage = FormatFeatureFlags(rawValue: 0x00000001)
    public static let storageImage = FormatFeatureFlags(rawValue: 0x00000002)
    public static let storageImageAtomic = FormatFeatureFlags(rawValue: 0x00000004)
    public static let unifomTexelBuffer = FormatFeatureFlags(rawValue: 0x00000008)
    public static let storageTexelBuffer = FormatFeatureFlags(rawValue: 0x00000010)
    public static let storageTexelBufferAtomic = FormatFeatureFlags(rawValue: 0x00000020)
    public static let vertexBuffer = FormatFeatureFlags(rawValue: 0x00000040)
    public static let colorAttachment = FormatFeatureFlags(rawValue: 0x00000080)
    public static let colorAttachmentBlend = FormatFeatureFlags(rawValue: 0x00000100)
    public static let depthStencilAttachment = FormatFeatureFlags(rawValue: 0x00000200)
    public static let blitSrc = FormatFeatureFlags(rawValue: 0x00000400)
    public static let blitDst = FormatFeatureFlags(rawValue: 0x00000800)
    public static let sampledImageFilterLinear = FormatFeatureFlags(rawValue: 0x00001000)
    public static let transferSrc = FormatFeatureFlags(rawValue: 0x00004000)
    public static let transferDst = FormatFeatureFlags(rawValue: 0x00008000)
    public static let midpointChromaSamples = FormatFeatureFlags(rawValue: 0x00020000)
    public static let sampledImageYcbcrConversionLinearFilter = FormatFeatureFlags(rawValue: 0x00040000)
    public static let sampledImageYcbcrConversionSeparateReconstructionFilter = FormatFeatureFlags(rawValue: 0x00080000)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicit = FormatFeatureFlags(rawValue: 0x00100000)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicitForceable = FormatFeatureFlags(rawValue: 0x00200000)
    public static let disjoint = FormatFeatureFlags(rawValue: 0x00400000)
    public static let cositedChromaSamples = FormatFeatureFlags(rawValue: 0x00800000)
    public static let sampledImageFilterCubic = FormatFeatureFlags(rawValue: 0x00002000)
    public static let sampledImageFilterMinmax = FormatFeatureFlags(rawValue: 0x00010000)
    public static let fragmentDensityMap = FormatFeatureFlags(rawValue: 0x01000000)

    var vulkan: VkFormatFeatureFlags {
        return VkFormatFeatureFlags(self.rawValue)
    }
}

public struct MemoryHeapFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = MemoryHeapFlags(rawValue: 0)
    public static let deviceLocal = MemoryHeapFlags(rawValue: 0x00000001)
    public static let multiInstance = MemoryHeapFlags(rawValue: 0x00000002)

    var vulkan: VkMemoryHeapFlags {
        return VkMemoryHeapFlags(self.rawValue)
    }
}

public struct MemoryMapFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = MemoryMapFlags(rawValue: 0)

    var vulkan: VkMemoryMapFlags {
        return VkMemoryMapFlags(self.rawValue)
    }
}

public struct MemoryPropertyFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = MemoryPropertyFlags(rawValue: 0)
    public static let deviceLocal = MemoryPropertyFlags(rawValue: 0x00000001)
    public static let hostVisible = MemoryPropertyFlags(rawValue: 0x00000002)
    public static let hostCoherent = MemoryPropertyFlags(rawValue: 0x00000004)
    public static let hostCached = MemoryPropertyFlags(rawValue: 0x00000008)
    public static let lazilyAllocated = MemoryPropertyFlags(rawValue: 0x00000010)
    public static let protected = MemoryPropertyFlags(rawValue: 0x00000020)

    var vulkan: VkMemoryPropertyFlags {
        return VkMemoryPropertyFlags(self.rawValue)
    }
}

public struct PipelineStageFlags: WrapperStruct, OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = PipelineStageFlags(rawValue: 0)
    public static let topOfPipe = PipelineStageFlags(rawValue: 0x00000001)
    public static let drawIndirect = PipelineStageFlags(rawValue: 0x00000002)
    public static let vertexInput = PipelineStageFlags(rawValue: 0x00000004)
    public static let vertexShader = PipelineStageFlags(rawValue: 0x00000008)
    public static let tessellationControlShader = PipelineStageFlags(rawValue: 0x00000010)
    public static let tessellationEvaluationShader = PipelineStageFlags(rawValue: 0x00000020)
    public static let geometryShader = PipelineStageFlags(rawValue: 0x00000040)
    public static let fragmentShader = PipelineStageFlags(rawValue: 0x00000080)
    public static let earlyFragmentTests = PipelineStageFlags(rawValue: 0x00000100)
    public static let lateFragmentTests = PipelineStageFlags(rawValue: 0x00000200)
    public static let colorAttachmentOutput = PipelineStageFlags(rawValue: 0x00000400)
    public static let computeShader = PipelineStageFlags(rawValue: 0x00000800)
    public static let transfer = PipelineStageFlags(rawValue: 0x00001000)
    public static let bottomOfPipe = PipelineStageFlags(rawValue: 0x00002000)
    public static let host = PipelineStageFlags(rawValue: 0x00004000)
    public static let allGraphics = PipelineStageFlags(rawValue: 0x00008000)
    public static let allCommands = PipelineStageFlags(rawValue: 0x00010000)
    public static let transformFeedback = PipelineStageFlags(rawValue: 0x01000000)
    public static let conditionalRendering = PipelineStageFlags(rawValue: 0x00040000)
    public static let commandProcess = PipelineStageFlags(rawValue: 0x00020000)
    public static let shadingRateImage = PipelineStageFlags(rawValue: 0x00400000)
    public static let rayTracingShader = PipelineStageFlags(rawValue: 0x00200000)
    public static let accelerationStructureBuild = PipelineStageFlags(rawValue: 0x02000000)
    public static let taskShader = PipelineStageFlags(rawValue: 0x00080000)
    public static let meshShader = PipelineStageFlags(rawValue: 0x00100000)
    public static let fragmentDensityProcess = PipelineStageFlags(rawValue: 0x00800000)

    public var vulkan: VkPipelineStageFlags {
        VkPipelineStageFlags(self.rawValue)
    }
}

public struct OldSampleCountFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public init(fromVulkan: VkSampleCountFlags) {
        self.rawValue = fromVulkan
    }

    public init?(fromVulkan: VkSampleCountFlags?) {
        if let fromVulkan = fromVulkan {
            self.rawValue = fromVulkan
        } else {
            return nil
        }
    }

    public static let none = OldSampleCountFlags(rawValue: 0)
    public static let _1bit = OldSampleCountFlags(rawValue: 0x00000001)
    public static let _2bit = OldSampleCountFlags(rawValue: 0x00000002)
    public static let _4bit = OldSampleCountFlags(rawValue: 0x00000004)
    public static let _8bit = OldSampleCountFlags(rawValue: 0x00000008)
    public static let _16bit = OldSampleCountFlags(rawValue: 0x00000010)
    public static let _32bit = OldSampleCountFlags(rawValue: 0x00000020)
    public static let _64bit = OldSampleCountFlags(rawValue: 0x00000040)

    var vulkanValue: VkSampleCountFlagBits {
        return VkSampleCountFlagBits(self.rawValue)
    }
}

/*
public struct ShaderStageFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = ShaderStageFlags(rawValue: 0)
    public static let vertex = ShaderStageFlags(rawValue: 0x00000001)
    public static let tesselationControl = ShaderStageFlags(rawValue: 0x00000002)
    public static let tesselationEvaluation = ShaderStageFlags(rawValue: 0x00000004)
    public static let geometry = ShaderStageFlags(rawValue: 0x00000008)
    public static let fragment = ShaderStageFlags(rawValue: 0x00000010)
    public static let compute = ShaderStageFlags(rawValue: 0x00000020)
    public static let allGraphics = ShaderStageFlags(rawValue: 0x0000001F)
    public static let all = ShaderStageFlags(rawValue: 0x7FFFFFFF)
    public static let raygen = ShaderStageFlags(rawValue: 0x00000100)
    public static let anyHit = ShaderStageFlags(rawValue: 0x00000200)
    public static let closestHit = ShaderStageFlags(rawValue: 0x00000400)
    public static let miss = ShaderStageFlags(rawValue: 0x00000800)
    public static let intersection = ShaderStageFlags(rawValue: 0x00001000)
    public static let callable = ShaderStageFlags(rawValue: 0x00002000)
    public static let task = ShaderStageFlags(rawValue: 0x00000040)
    public static let mesh = ShaderStageFlags(rawValue: 0x00000080)

    var vulkan: VkShaderStageFlags {
        return VkShaderStageFlags(self.rawValue)
    }
}*/

public struct SubpassDescriptionFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = SubpassDescriptionFlags(rawValue: 0)
    public static let perViewAttributes = SubpassDescriptionFlags(rawValue: 1)
    public static let perViewPositionXOnly = SubpassDescriptionFlags(rawValue: 2)

    var vulkanValue: VkSubpassDescriptionFlags {
        return VkSubpassDescriptionFlags(self.rawValue)
    }
}

public struct SurfaceTransformFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = SurfaceTransformFlags(rawValue: 0)
    public static let identity = SurfaceTransformFlags(rawValue: 1 << 0)
    public static let rotate90 = SurfaceTransformFlags(rawValue: 1 << 1)
    public static let rotate180 = SurfaceTransformFlags(rawValue: 1 << 2)
    public static let rotate270 = SurfaceTransformFlags(rawValue: 1 << 3)
    public static let horizontalMirror = SurfaceTransformFlags(rawValue: 1 << 4)
    public static let horizontalMirrorRotate90 = SurfaceTransformFlags(rawValue: 1 << 5)
    public static let horizontalMirrorRotate180 = SurfaceTransformFlags(rawValue: 1 << 6)
    public static let horizontalMirrorRotate270 = SurfaceTransformFlags(rawValue: 1 << 7)
    public static let inherit = SurfaceTransformFlags(rawValue: 1 << 8)

    var vulkan: VkSurfaceTransformFlagBitsKHR {
        return VkSurfaceTransformFlagBitsKHR(self.rawValue)
    }
}

// ============


// ENUMS ========

public enum AttachmentLoadOp: UInt32 {
    case load = 0,
         clear = 1,
         dontCare = 2

    var vulkanValue: VkAttachmentLoadOp {
        return VkAttachmentLoadOp(self.rawValue)
    }
}

public enum AttachmentStoreOp: UInt32 {
    case store = 0,
         dontCare = 1

    var vulkanValue: VkAttachmentStoreOp {
        return VkAttachmentStoreOp(self.rawValue)
    }
}

public enum CommandBufferLevel: UInt32 {
    case primary = 0,
         secondary = 1
}

public enum ComponentSwizzle: UInt32 {
    case identity = 0,
         zero = 1,
         one = 2,
         r = 3,
         g = 4,
         b = 5,
         a = 6

    var vulkan: VkComponentSwizzle {
        return VkComponentSwizzle(self.rawValue)
    }
}

public enum ColorSpace: UInt32 {
    case SRGB_NONLINEAR_KHR = 0,
         DISPLAY_P3_NONLINEAR_EXT = 1000104001,
         EXTENDED_SRGB_LINEAR_EXT = 1000104002,
         DCI_P3_LINEAR_EXT = 1000104003,
         DCI_P3_NONLINEAR_EXT = 1000104004,
         BT709_LINEAR_EXT = 1000104005,
         BT709_NONLINEAR_EXT = 1000104006,
         BT2020_LINEAR_EXT = 1000104007,
         HDR10_ST2084_EXT = 1000104008,
         DOLBYVISION_EXT = 1000104009,
         HDR10_HLG_EXT = 1000104010,
         ADOBERGB_LINEAR_EXT = 1000104011,
         ADOBERGB_NONLINEAR_EXT = 1000104012,
         PASS_THROUGH_EXT = 1000104013,
         EXTENDED_SRGB_NONLINEAR_EXT = 1000104014

    var vulkanValue: VkColorSpaceKHR {
        return VkColorSpaceKHR(self.rawValue)
    }
}

public enum DescriptorType: UInt32 {
    case sampler = 0,
         combinedImageSampler = 1,
         sampledImage = 2,
         storageImage = 3,
         uniformTexelBuffer = 4,
         storageTexelBuffer = 5,
         uniformBuffer = 6,
         storageBuffer = 7,
         uniformBufferDynamic = 8,
         storageBufferDynamic = 9,
         inputAttachment = 10,
         inlineUniformBlock = 1000138000,
         accelerationStructureKhr = 1000150000

    var vulkan: VkDescriptorType {
        VkDescriptorType(rawValue: self.rawValue)
    }
}

public enum ImageLayout: UInt32 {
    case undefined = 0,
         general = 1,
         colorAttachmentOptimal = 2,
         depthStencilAttachmentOptimal = 3,
         depthStencilReadOnlyOptimal = 4,
         shaderReadOnlyOptimal = 5,
         transferSrcOptimal = 6,
         transferDstOptimal = 7,
         preinitialized = 8,
         depthReadOnlyStencilAttachmentOptimal = 1000117000,
         depthAttachmentStencilReadOnlyOptimal = 1000117001,
         presentSrc = 1000001002,
         shaderPresent = 1000111000,
         shadingRateOptimal = 1000164003,
         fragmentDensityMapOptimal = 1000218000

    public var vulkan: VkImageLayout {
        VkImageLayout(self.rawValue)
    }
}

public enum ImageTiling: UInt32 {
    case optimal = 0,
         linear = 1,
         drmFormatModifier = 1000158000

    public var vulkan: VkImageTiling {
        return VkImageTiling(self.rawValue)
    }
}

public enum ImageType: UInt32 {
    case type1D = 0,
         type2D = 1,
         type3D = 2

    var vulkan: VkImageType {
        return VkImageType(self.rawValue)
    }
}

public enum ImageViewType: UInt32 {
    case type1D = 0,
         type2D = 1,
         type3D = 2,
         typeCube = 3,
         type1DArray = 4,
         type2DArray = 5,
         typeCubeArray = 6

    var vulkan: VkImageViewType {
        return VkImageViewType(self.rawValue)
    }
}
/*
public enum PhysicalDeviceType: UInt32 {
    case other = 0,
         integratedGpu,
         discreteGpu,
         virtualGpu,
         cpu
}*/

public enum PresentMode: UInt32 {
    case immediate = 0,
         mailbox = 1,
         fifo = 2,
         fifoRelaxed = 3,
         sharedDemandRefresh = 1000111000,
         sharedContinuousRefresh = 1000111001

    var vulkan: VkPresentModeKHR {
        return VkPresentModeKHR(self.rawValue)
    }
}

public enum SharingMode: UInt32 {
    case exclusive = 0,
         concurrent = 1

    var vulkanValue: VkSharingMode {
        return VkSharingMode(self.rawValue)
    }
}

// ============
