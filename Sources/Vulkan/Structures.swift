//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

public typealias DeviceSize = UInt64
/*
public struct ApplicationInfo {
    // not supported for now
    public let next: Any? = nil
    public let applicationName: String
    public let applicationVersion: UInt32
    public let engineName: String
    public let engineVersion: UInt32
    public let apiVersion: UInt32

    public init(applicationName: String,
                applicationVersion: Version,
                engineName: String,
                engineVersion: Version,
                apiVersion: Version) {
        self.applicationName = applicationName
        self.applicationVersion = applicationVersion.rawVersion
        self.engineName = engineName
        self.engineVersion = engineVersion.rawVersion
        self.apiVersion = apiVersion.rawVersion
    }
}*/
/*
public struct ComponentMapping {
    public let r: ComponentSwizzle
    public let g: ComponentSwizzle
    public let b: ComponentSwizzle
    public let a: ComponentSwizzle

    public init(r: ComponentSwizzle,
                g: ComponentSwizzle,
                b: ComponentSwizzle,
                a: ComponentSwizzle) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }

    var vulkan: VkComponentMapping {
        return VkComponentMapping(r: self.r.vulkan,
                g: self.g.vulkan,
                b: self.b.vulkan,
                a: self.a.vulkan)
    }

    public static let identity = ComponentMapping.init(r: .r, g: .g, b: .b, a: .a)
}*/

public struct CopyDescriptorSet {
    public let srcSet: DescriptorSet
    public let srcBinding: UInt32
    public let srcArrayElement: UInt32
    public let dstSet: DescriptorSet
    public let dstBinding: UInt32
    public let dstArrayElement: UInt32
    public let descriptorCount: UInt32

    func toVulkan() -> VkCopyDescriptorSet {
        return VkCopyDescriptorSet(
                sType: VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET,
                pNext: nil,
                srcSet: srcSet.pointer,
                srcBinding: srcBinding,
                srcArrayElement: srcArrayElement,
                dstSet: dstSet.pointer,
                dstBinding: dstBinding,
                dstArrayElement: dstArrayElement,
                descriptorCount: descriptorCount
        )
    }
}
/*
public struct DescriptorBufferInfo {
    public let buffer: Buffer
    public let offset: DeviceSize
    public let range: DeviceSize

    public init(buffer: Buffer,
                offset: DeviceSize,
                range: DeviceSize) {
        self.buffer = buffer
        self.offset = offset
        self.range = range
    }

    func toVulkan() -> VkDescriptorBufferInfo {
        let value = VkDescriptorBufferInfo(
                buffer: buffer.pointer,
                offset: self.offset,
                range: self.range
        )

        return value
    }
}*/
/*
public struct DescriptorImageInfo {
    public let sampler: Sampler
    public let imageView: ImageView
    public let imageLayout: ImageLayout

    func toVulkan() -> VkDescriptorImageInfo {
        let value = VkDescriptorImageInfo(
                sampler: sampler.vulkan,
                imageView: imageView.pointer,
                imageLayout: imageLayout.vulkanValue
        )

        return value
    }
}*/

/*
public struct DescriptorPoolSize: WrapperStruct {
    public var type: DescriptorType
    public var descriptorCount: UInt32

    public init(type: DescriptorType,
                descriptorCount: UInt32) {
        self.type = type
        self.descriptorCount = descriptorCount
    }

    var vulkanValue: VkDescriptorPoolSize {
        return VkDescriptorPoolSize(
                type: self.type.vulkanValue,
                descriptorCount: self.descriptorCount
        )
    }
}*/

/*public struct DescriptorSetAllocateInfo {
    public var descriptorPool: DescriptorPool
    public var descriptorSetCount: UInt32
    public var setLayouts: [DescriptorSetLayout]

    public init(descriptorPool: DescriptorPool,
                descriptorSetCount: UInt32,
                setLayouts: [DescriptorSetLayout]) {
        self.descriptorPool = descriptorPool
        self.descriptorSetCount = descriptorSetCount
        self.setLayouts = setLayouts
    }
}*/
/*
public struct DescriptorSetLayoutCreateInfo {
    public var flags: Flags
    public var bindings: [DescriptorSetLayoutBinding]

    public init(flags: Flags,
                bindings: [DescriptorSetLayoutBinding]) {
        self.flags = flags
        self.bindings = bindings
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let pushDescriptor = Flags(rawValue: 0x00000001)
        public static let updateAfterBindPool = Flags(rawValue: 0x00000002)
    }

    var vulkanValue: VkDescriptorSetLayoutCreateInfo {
        return VkDescriptorSetLayoutCreateInfo(
                sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
                pNext: nil,
                flags: self.flags.rawValue,
                bindingCount: UInt32(self.bindings.count),
                pBindings: self.bindings.map {
                    $0.vulkanValue
                }
        )
    }
}*/
/*
public struct DescriptorSetLayoutBinding {
    public var binding = UInt32(0)
    public var descriptorType = DescriptorType.sampler
    public var descriptorCount = UInt32(0)
    public var stageFlags = ShaderStageFlags.none
    public var immutableSamplers: [Sampler]? = nil

    public init(binding: UInt32,
                descriptorType: DescriptorType,
                descriptorCount: UInt32,
                stageFlags: ShaderStageFlags,
                immutableSamplers: [Sampler]?) {
        self.binding = binding
        self.descriptorType = descriptorType
        self.descriptorCount = descriptorCount
        self.stageFlags = stageFlags
        self.immutableSamplers = immutableSamplers
    }

    var vulkanValue: VkDescriptorSetLayoutBinding {
        return VkDescriptorSetLayoutBinding(
                binding: self.binding,
                descriptorType: self.descriptorType.vulkan,
                descriptorCount: self.descriptorCount,
                stageFlags: UInt32(self.stageFlags.rawValue),
                pImmutableSamplers: immutableSamplers?.vulkanPointer
        )
    }
}*/

public struct DeviceCreateInfo {
    public let flags: Flags
    public let queueCreateInfos: [DeviceQueueCreateInfo]
    public let enabledLayers: [String]
    public let enabledExtensions: [String]
    public let enabledFeatures: PhysicalDeviceFeatures

    public init(flags: Flags,
                queueCreateInfos: [DeviceQueueCreateInfo],
                enabledLayers: [String],
                enabledExtensions: [String],
                enabledFeatures: PhysicalDeviceFeatures) {
        self.flags = flags
        self.queueCreateInfos = queueCreateInfos
        self.enabledLayers = enabledLayers
        self.enabledExtensions = enabledExtensions
        self.enabledFeatures = enabledFeatures
    }

    public struct Flags: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    func vulkanExec(action: (VkDeviceCreateInfo) -> ()) {

        let queueCreateInfos = self.queueCreateInfos.map {
            $0.toVulkan()
        }

        withArrayOfCStrings(self.enabledLayers) { layers in
            withArrayOfCStrings(self.enabledExtensions) { extensions in

                var featureArr = [self.enabledFeatures.toVulkan()]
                let dc = VkDeviceCreateInfo(
                        sType: VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
                        pNext: nil,
                        flags: UInt32(flags.rawValue),
                        queueCreateInfoCount: UInt32(self.queueCreateInfos.count),
                        pQueueCreateInfos: queueCreateInfos,
                        enabledLayerCount: UInt32(self.enabledLayers.count),
                        ppEnabledLayerNames: layers,
                        enabledExtensionCount: UInt32(self.enabledExtensions.count),
                        ppEnabledExtensionNames: extensions,
                        pEnabledFeatures: UnsafePointer(&featureArr)
                )

                action(dc)
            }
        }
    }
}

public struct DeviceQueueCreateInfo {
    public let flags: Flags
    public let queueFamilyIndex: UInt32
    public let queuePriorities: [Float]

    public struct Flags: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let protectedBit = Flags(rawValue: 1)
    }

    public init(flags: Flags,
                queueFamilyIndex: UInt32,
                queuePriorities: [Float]) {
        self.flags = flags
        self.queueFamilyIndex = queueFamilyIndex
        self.queuePriorities = queuePriorities
    }

    func toVulkan() -> VkDeviceQueueCreateInfo {
        return VkDeviceQueueCreateInfo(
                sType: VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
                pNext: nil,
                flags: UInt32(self.flags.rawValue),
                queueFamilyIndex: self.queueFamilyIndex,
                queueCount: UInt32(self.queuePriorities.count),
                pQueuePriorities: self.queuePriorities
        )
    }
}

public struct ExtensionProperties {
    public let extensionName: String
    public let specVersion: Version

    init(props: VkExtensionProperties) {
        self.extensionName = convertTupleToString(props.extensionName)
        self.specVersion = Version(from: props.specVersion)
    }
}

public struct Extent3D {
    public var width: UInt32
    public var height: UInt32
    public var depth: UInt32

    public init(width: UInt32, height: UInt32, depth: UInt32) {
        self.width = width
        self.height = height
        self.depth = depth
    }

    var vulkan: VkExtent3D {
        VkExtent3D(width: self.width, height: self.height, depth: self.depth)
    }
}

public struct FormatProperties {
    public let linearTilingFeatures: FormatFeatureFlags
    public let optimalTilingFeatures: FormatFeatureFlags
    public let bufferFeatures: FormatFeatureFlags

    init(_ properties: VkFormatProperties) {
        self.linearTilingFeatures = FormatFeatureFlags(rawValue: properties.linearTilingFeatures)
        self.optimalTilingFeatures = FormatFeatureFlags(rawValue: properties.optimalTilingFeatures)
        self.bufferFeatures = FormatFeatureFlags(rawValue: properties.bufferFeatures)
    }
}

public struct ImageCreateInfo {
    public let flags: Flags
    public let imageType: ImageType
    public let format: Format
    public let extent: Extent3D
    public let mipLevels: UInt32
    public let arrayLayers: UInt32
    public let samples: OldSampleCountFlags
    public let tiling: ImageTiling
    public let usage: ImageUsageFlags
    public let sharingMode: SharingMode
    public let queueFamilyIndices: [UInt32]?
    public let initialLayout: ImageLayout

    public init(flags: Flags,
                imageType: ImageType,
                format: Format,
                extent: Extent3D,
                mipLevels: UInt32,
                arrayLayers: UInt32,
                samples: OldSampleCountFlags,
                tiling: ImageTiling,
                usage: ImageUsageFlags,
                sharingMode: SharingMode,
                queueFamilyIndices: [UInt32]?,
                initialLayout: ImageLayout) {
        self.flags = flags
        self.imageType = imageType
        self.format = format
        self.extent = extent
        self.mipLevels = mipLevels
        self.arrayLayers = arrayLayers
        self.samples = samples
        self.tiling = tiling
        self.usage = usage
        self.sharingMode = sharingMode
        self.queueFamilyIndices = queueFamilyIndices
        self.initialLayout = initialLayout
    }

    public struct Flags: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let sparseBinding = Flags(rawValue: 1 << 0)
        public static let sparseResidency = Flags(rawValue: 1 << 1)
        public static let sparseAliased = Flags(rawValue: 1 << 2)
        public static let mutableFormat = Flags(rawValue: 1 << 3)
        public static let cubeCompatible = Flags(rawValue: 1 << 4)
        public static let alias = Flags(rawValue: 0x00000400)
        public static let splitInstanceBindRegions = Flags(rawValue: 0x00000040)
        public static let _2dArrayCompatible = Flags(rawValue: 0x00000020)
        public static let blockTexelViewCompatible = Flags(rawValue: 0x00000080)
        public static let extendedUsage = Flags(rawValue: 0x00000100)
        public static let protected = Flags(rawValue: 0x00000800)
        public static let disjoint = Flags(rawValue: 0x00000200)
        public static let cornerSampled = Flags(rawValue: 0x00002000)
        public static let sampleLocationsCompatibleDepth = Flags(rawValue: 0x00001000)
        public static let subsampled = Flags(rawValue: 0x00004000)

        var vulkan: VkImageCreateFlags {
            return VkImageCreateFlags(rawValue)
        }
    }

    var vulkan: VkImageCreateInfo {
        return VkImageCreateInfo(
                sType: VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO,
                pNext: nil,
                flags: self.flags.vulkan,
                imageType: self.imageType.vulkan,
                format: self.format.vulkan,
                extent: self.extent.vulkan,
                mipLevels: self.mipLevels,
                arrayLayers: self.arrayLayers,
                samples: self.samples.vulkanValue,
                tiling: self.tiling.vulkan,
                usage: self.usage.vulkan,
                sharingMode: self.sharingMode.vulkanValue,
                queueFamilyIndexCount: self.queueFamilyIndices == nil ? 0 : UInt32(self.queueFamilyIndices!.count),
                pQueueFamilyIndices: self.queueFamilyIndices,
                initialLayout: self.initialLayout.vulkan)
    }
}
/*
public struct ImageViewCreateInfo {

    public let flags: Flags
    public let image: Image
    public let viewType: ImageViewType
    public let format: Format
    public let components: ComponentMapping
    public let subresourceRange: ImageSubresourceRange

    public init(flags: Flags,
                image: Image,
                viewType: ImageViewType,
                format: Format,
                components: ComponentMapping,
                subresourceRange: ImageSubresourceRange) {
        self.flags = flags
        self.image = image
        self.viewType = viewType
        self.format = format
        self.components = components
        self.subresourceRange = subresourceRange
    }

    public struct Flags: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let fragmentDensityMapDynamic = Flags(rawValue: 1)

        var vulkan: VkImageViewCreateFlags {
            return VkImageViewCreateFlags(rawValue)
        }
    }

    var vulkan: VkImageViewCreateInfo {
        return VkImageViewCreateInfo(
                sType: VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
                pNext: nil,
                flags: self.flags.vulkan,
                image: self.image.pointer,
                viewType: self.viewType.vulkan,
                format: self.format.vulkan,
                components: self.components.vulkan,
                subresourceRange: self.subresourceRange.vulkan)
    }
}*/
/*
public struct ImageSubresourceRange {
    public let aspectMask: ImageAspectFlags
    public let baseMipLevel: UInt32
    public let levelCount: UInt32
    public let baseArrayLayer: UInt32
    public let layerCount: UInt32

    public init(aspectMask: ImageAspectFlags,
                baseMipLevel: UInt32,
                levelCount: UInt32,
                baseArrayLayer: UInt32,
                layerCount: UInt32) {
        self.aspectMask = aspectMask
        self.baseMipLevel = baseMipLevel
        self.levelCount = levelCount
        self.baseArrayLayer = baseArrayLayer
        self.layerCount = layerCount
    }

    var vulkan: VkImageSubresourceRange {
        return VkImageSubresourceRange(
                aspectMask: self.aspectMask.vulkan,
                baseMipLevel: self.baseMipLevel,
                levelCount: self.levelCount,
                baseArrayLayer: self.baseArrayLayer,
                layerCount: self.layerCount)
    }
}*/

public struct InstanceCreateInfo {
    public let next: Any? = nil
    public let flags = 0
    public var applicationInfo: ApplicationInfo?
    public let enabledLayerNames: [String]
    public let enabledExtensionNames: [String]

    public init(applicationInfo: ApplicationInfo?,
                enabledLayerNames: [String],
                enabledExtensionNames: [String]) {
        self.applicationInfo = applicationInfo
        self.enabledLayerNames = enabledLayerNames
        self.enabledExtensionNames = enabledExtensionNames
    }
}

public struct LayerProperties {
    let layerName: String
    let specVersion: UInt32
    let implementationVersion: UInt32
    let description: String

    init(layerName: String,
         specVersion: Version,
         implementationVersion: Version,
         description: String) {
        self.layerName = layerName
        self.specVersion = specVersion.rawVersion
        self.implementationVersion = implementationVersion.rawVersion
        self.description = description
    }
}

public struct MemoryAllocateInfo {
    public var allocationSize: DeviceSize
    public var memoryTypeIndex: UInt32

    public init() {
        self.allocationSize = 0
        self.memoryTypeIndex = 0
    }

    public init(allocationSize: DeviceSize,
                memoryTypeIndex: UInt32) {
        self.allocationSize = allocationSize
        self.memoryTypeIndex = memoryTypeIndex
    }

    var vulkan: VkMemoryAllocateInfo {
        return VkMemoryAllocateInfo(
                sType: VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
                pNext: nil,
                allocationSize: self.allocationSize,
                memoryTypeIndex: self.memoryTypeIndex
        )
    }
}

public struct MemoryRequirements {
    public let size: DeviceSize
    public let alignment: DeviceSize
    public let memoryTypeBits: UInt32

    init(_ memReqs: VkMemoryRequirements) {
        self.size = memReqs.size
        self.alignment = memReqs.alignment
        self.memoryTypeBits = memReqs.memoryTypeBits
    }
}

public struct MemoryHeap {
    public let size: DeviceSize
    public let flags: MemoryHeapFlags

    init(_ memHeap: VkMemoryHeap) {
        self.size = memHeap.size
        self.flags = MemoryHeapFlags(rawValue: memHeap.flags)
    }
}

public struct MemoryType {
    public let propertyFlags: MemoryPropertyFlags
    public let heapIndex: UInt32

    init(_ memType: VkMemoryType) {
        self.propertyFlags = MemoryPropertyFlags(rawValue: memType.propertyFlags)
        self.heapIndex = memType.heapIndex
    }
}
/*
public struct PipelineLayoutCreateInfo {
    public var flags: Flags = .none
    public var setLayouts: [DescriptorSetLayout] = []
    public var pushConstantRanges: [PushConstantRange] = []

    public init(flags: Flags,
                setLayouts: [DescriptorSetLayout],
                pushConstantRanges: [PushConstantRange]) {
        self.flags = flags
        self.setLayouts = setLayouts
        self.pushConstantRanges = pushConstantRanges
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    var vulkan: VkPipelineLayoutCreateInfo {
        VkPipelineLayoutCreateInfo(
                sType: VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
                pNext: nil,
                flags: flags.rawValue,
                setLayoutCount: UInt32(setLayouts.count),
                pSetLayouts: setLayouts.vulkanPointer,
                pushConstantRangeCount: UInt32(pushConstantRanges.count),
                pPushConstantRanges: pushConstantRanges.vulkanPointer
        )
    }
}*/

public struct PhysicalDeviceFeatures {
    public var robustBufferAccess: Bool
    public var fullDrawIndexUint32: Bool
    public var imageCubeArray: Bool
    public var independentBlend: Bool
    public var geometryShader: Bool
    public var tessellationShader: Bool
    public var sampleRateShading: Bool
    public var dualSrcBlend: Bool
    public var logicOp: Bool
    public var multiDrawIndirect: Bool
    public var drawIndirectFirstInstance: Bool
    public var depthClamp: Bool
    public var depthBiasClamp: Bool
    public var fillModeNonSolid: Bool
    public var depthBounds: Bool
    public var wideLines: Bool
    public var largePoints: Bool
    public var alphaToOne: Bool
    public var multiViewport: Bool
    public var samplerAnisotropy: Bool
    public var textureCompressionETC2: Bool
    public var textureCompressionASTC_LDR: Bool
    public var textureCompressionBC: Bool
    public var occlusionQueryPrecise: Bool
    public var pipelineStatisticsQuery: Bool
    public var vertexPipelineStoresAndAtomics: Bool
    public var fragmentStoresAndAtomics: Bool
    public var shaderTessellationAndGeometryPointSize: Bool
    public var shaderImageGatherExtended: Bool
    public var shaderStorageImageExtendedFormats: Bool
    public var shaderStorageImageMultisample: Bool
    public var shaderStorageImageReadWithoutFormat: Bool
    public var shaderStorageImageWriteWithoutFormat: Bool
    public var shaderUniformBufferArrayDynamicIndexing: Bool
    public var shaderSampledImageArrayDynamicIndexing: Bool
    public var shaderStorageBufferArrayDynamicIndexing: Bool
    public var shaderStorageImageArrayDynamicIndexing: Bool
    public var shaderClipDistance: Bool
    public var shaderCullDistance: Bool
    public var shaderFloat64: Bool
    public var shaderInt64: Bool
    public var shaderInt16: Bool
    public var shaderResourceResidency: Bool
    public var shaderResourceMinLod: Bool
    public var sparseBinding: Bool
    public var sparseResidencyBuffer: Bool
    public var sparseResidencyImage2D: Bool
    public var sparseResidencyImage3D: Bool
    public var sparseResidency2Samples: Bool
    public var sparseResidency4Samples: Bool
    public var sparseResidency8Samples: Bool
    public var sparseResidency16Samples: Bool
    public var sparseResidencyAliased: Bool
    public var variableMultisampleRate: Bool
    public var inheritedQueries: Bool

    public init() {
        robustBufferAccess = false
        fullDrawIndexUint32 = false
        imageCubeArray = false
        independentBlend = false
        geometryShader = false
        tessellationShader = false
        sampleRateShading = false
        dualSrcBlend = false
        logicOp = false
        multiDrawIndirect = false
        drawIndirectFirstInstance = false
        depthClamp = false
        depthBiasClamp = false
        fillModeNonSolid = false
        depthBounds = false
        wideLines = false
        largePoints = false
        alphaToOne = false
        multiViewport = false
        samplerAnisotropy = false
        textureCompressionETC2 = false
        textureCompressionASTC_LDR = false
        textureCompressionBC = false
        occlusionQueryPrecise = false
        pipelineStatisticsQuery = false
        vertexPipelineStoresAndAtomics = false
        fragmentStoresAndAtomics = false
        shaderTessellationAndGeometryPointSize = false
        shaderImageGatherExtended = false
        shaderStorageImageExtendedFormats = false
        shaderStorageImageMultisample = false
        shaderStorageImageReadWithoutFormat = false
        shaderStorageImageWriteWithoutFormat = false
        shaderUniformBufferArrayDynamicIndexing = false
        shaderSampledImageArrayDynamicIndexing = false
        shaderStorageBufferArrayDynamicIndexing = false
        shaderStorageImageArrayDynamicIndexing = false
        shaderClipDistance = false
        shaderCullDistance = false
        shaderFloat64 = false
        shaderInt64 = false
        shaderInt16 = false
        shaderResourceResidency = false
        shaderResourceMinLod = false
        sparseBinding = false
        sparseResidencyBuffer = false
        sparseResidencyImage2D = false
        sparseResidencyImage3D = false
        sparseResidency2Samples = false
        sparseResidency4Samples = false
        sparseResidency8Samples = false
        sparseResidency16Samples = false
        sparseResidencyAliased = false
        variableMultisampleRate = false
        inheritedQueries = false
    }

    init(vkFeatures: VkPhysicalDeviceFeatures) {
        self.robustBufferAccess = vkFeatures.robustBufferAccess.toBool()
        self.fullDrawIndexUint32 = vkFeatures.fullDrawIndexUint32.toBool()
        self.imageCubeArray = vkFeatures.imageCubeArray.toBool()
        self.independentBlend = vkFeatures.independentBlend.toBool()
        self.geometryShader = vkFeatures.geometryShader.toBool()
        self.tessellationShader = vkFeatures.tessellationShader.toBool()
        self.sampleRateShading = vkFeatures.sampleRateShading.toBool()
        self.dualSrcBlend = vkFeatures.dualSrcBlend.toBool()
        self.logicOp = vkFeatures.logicOp.toBool()
        self.multiDrawIndirect = vkFeatures.multiDrawIndirect.toBool()
        self.drawIndirectFirstInstance = vkFeatures.drawIndirectFirstInstance.toBool()
        self.depthClamp = vkFeatures.depthClamp.toBool()
        self.depthBiasClamp = vkFeatures.depthBiasClamp.toBool()
        self.fillModeNonSolid = vkFeatures.fillModeNonSolid.toBool()
        self.depthBounds = vkFeatures.depthBounds.toBool()
        self.wideLines = vkFeatures.wideLines.toBool()
        self.largePoints = vkFeatures.largePoints.toBool()
        self.alphaToOne = vkFeatures.alphaToOne.toBool()
        self.multiViewport = vkFeatures.multiViewport.toBool()
        self.samplerAnisotropy = vkFeatures.samplerAnisotropy.toBool()
        self.textureCompressionETC2 = vkFeatures.textureCompressionETC2.toBool()
        self.textureCompressionASTC_LDR = vkFeatures.textureCompressionASTC_LDR.toBool()
        self.textureCompressionBC = vkFeatures.textureCompressionBC.toBool()
        self.occlusionQueryPrecise = vkFeatures.occlusionQueryPrecise.toBool()
        self.pipelineStatisticsQuery = vkFeatures.pipelineStatisticsQuery.toBool()
        self.vertexPipelineStoresAndAtomics = vkFeatures.vertexPipelineStoresAndAtomics.toBool()
        self.fragmentStoresAndAtomics = vkFeatures.fragmentStoresAndAtomics.toBool()
        self.shaderTessellationAndGeometryPointSize = vkFeatures.shaderTessellationAndGeometryPointSize.toBool()
        self.shaderImageGatherExtended = vkFeatures.shaderImageGatherExtended.toBool()
        self.shaderStorageImageExtendedFormats = vkFeatures.shaderStorageImageExtendedFormats.toBool()
        self.shaderStorageImageMultisample = vkFeatures.shaderStorageImageMultisample.toBool()
        self.shaderStorageImageReadWithoutFormat = vkFeatures.shaderStorageImageReadWithoutFormat.toBool()
        self.shaderStorageImageWriteWithoutFormat = vkFeatures.shaderStorageImageWriteWithoutFormat.toBool()
        self.shaderUniformBufferArrayDynamicIndexing = vkFeatures.shaderUniformBufferArrayDynamicIndexing.toBool()
        self.shaderSampledImageArrayDynamicIndexing = vkFeatures.shaderSampledImageArrayDynamicIndexing.toBool()
        self.shaderStorageBufferArrayDynamicIndexing = vkFeatures.shaderStorageBufferArrayDynamicIndexing.toBool()
        self.shaderStorageImageArrayDynamicIndexing = vkFeatures.shaderStorageImageArrayDynamicIndexing.toBool()
        self.shaderClipDistance = vkFeatures.shaderClipDistance.toBool()
        self.shaderCullDistance = vkFeatures.shaderCullDistance.toBool()
        self.shaderFloat64 = vkFeatures.shaderFloat64.toBool()
        self.shaderInt64 = vkFeatures.shaderInt64.toBool()
        self.shaderInt16 = vkFeatures.shaderInt16.toBool()
        self.shaderResourceResidency = vkFeatures.shaderResourceResidency.toBool()
        self.shaderResourceMinLod = vkFeatures.shaderResourceMinLod.toBool()
        self.sparseBinding = vkFeatures.sparseBinding.toBool()
        self.sparseResidencyBuffer = vkFeatures.sparseResidencyBuffer.toBool()
        self.sparseResidencyImage2D = vkFeatures.sparseResidencyImage2D.toBool()
        self.sparseResidencyImage3D = vkFeatures.sparseResidencyImage3D.toBool()
        self.sparseResidency2Samples = vkFeatures.sparseResidency2Samples.toBool()
        self.sparseResidency4Samples = vkFeatures.sparseResidency4Samples.toBool()
        self.sparseResidency8Samples = vkFeatures.sparseResidency8Samples.toBool()
        self.sparseResidency16Samples = vkFeatures.sparseResidency16Samples.toBool()
        self.sparseResidencyAliased = vkFeatures.sparseResidencyAliased.toBool()
        self.variableMultisampleRate = vkFeatures.variableMultisampleRate.toBool()
        self.inheritedQueries = vkFeatures.inheritedQueries.toBool()
    }

    func toVulkan() -> VkPhysicalDeviceFeatures {
        return VkPhysicalDeviceFeatures(
                robustBufferAccess: self.robustBufferAccess.toUInt32(),
                fullDrawIndexUint32: self.fullDrawIndexUint32.toUInt32(),
                imageCubeArray: self.imageCubeArray.toUInt32(),
                independentBlend: self.independentBlend.toUInt32(),
                geometryShader: self.geometryShader.toUInt32(),
                tessellationShader: self.tessellationShader.toUInt32(),
                sampleRateShading: self.sampleRateShading.toUInt32(),
                dualSrcBlend: self.dualSrcBlend.toUInt32(),
                logicOp: self.logicOp.toUInt32(),
                multiDrawIndirect: self.multiDrawIndirect.toUInt32(),
                drawIndirectFirstInstance: self.drawIndirectFirstInstance.toUInt32(),
                depthClamp: self.depthClamp.toUInt32(),
                depthBiasClamp: self.depthBiasClamp.toUInt32(),
                fillModeNonSolid: self.fillModeNonSolid.toUInt32(),
                depthBounds: self.depthBounds.toUInt32(),
                wideLines: self.wideLines.toUInt32(),
                largePoints: self.largePoints.toUInt32(),
                alphaToOne: self.alphaToOne.toUInt32(),
                multiViewport: self.multiViewport.toUInt32(),
                samplerAnisotropy: self.samplerAnisotropy.toUInt32(),
                textureCompressionETC2: self.textureCompressionETC2.toUInt32(),
                textureCompressionASTC_LDR: self.textureCompressionASTC_LDR.toUInt32(),
                textureCompressionBC: self.textureCompressionBC.toUInt32(),
                occlusionQueryPrecise: self.occlusionQueryPrecise.toUInt32(),
                pipelineStatisticsQuery: self.pipelineStatisticsQuery.toUInt32(),
                vertexPipelineStoresAndAtomics: self.vertexPipelineStoresAndAtomics.toUInt32(),
                fragmentStoresAndAtomics: self.fragmentStoresAndAtomics.toUInt32(),
                shaderTessellationAndGeometryPointSize: self.shaderTessellationAndGeometryPointSize.toUInt32(),
                shaderImageGatherExtended: self.shaderImageGatherExtended.toUInt32(),
                shaderStorageImageExtendedFormats: self.shaderStorageImageExtendedFormats.toUInt32(),
                shaderStorageImageMultisample: self.shaderStorageImageMultisample.toUInt32(),
                shaderStorageImageReadWithoutFormat: self.shaderStorageImageReadWithoutFormat.toUInt32(),
                shaderStorageImageWriteWithoutFormat: self.shaderStorageImageWriteWithoutFormat.toUInt32(),
                shaderUniformBufferArrayDynamicIndexing: self.shaderUniformBufferArrayDynamicIndexing.toUInt32(),
                shaderSampledImageArrayDynamicIndexing: self.shaderSampledImageArrayDynamicIndexing.toUInt32(),
                shaderStorageBufferArrayDynamicIndexing: self.shaderStorageBufferArrayDynamicIndexing.toUInt32(),
                shaderStorageImageArrayDynamicIndexing: self.shaderStorageImageArrayDynamicIndexing.toUInt32(),
                shaderClipDistance: self.shaderClipDistance.toUInt32(),
                shaderCullDistance: self.shaderCullDistance.toUInt32(),
                shaderFloat64: self.shaderFloat64.toUInt32(),
                shaderInt64: self.shaderInt64.toUInt32(),
                shaderInt16: self.shaderInt16.toUInt32(),
                shaderResourceResidency: self.shaderResourceResidency.toUInt32(),
                shaderResourceMinLod: self.shaderResourceMinLod.toUInt32(),
                sparseBinding: self.sparseBinding.toUInt32(),
                sparseResidencyBuffer: self.sparseResidencyBuffer.toUInt32(),
                sparseResidencyImage2D: self.sparseResidencyImage2D.toUInt32(),
                sparseResidencyImage3D: self.sparseResidencyImage3D.toUInt32(),
                sparseResidency2Samples: self.sparseResidency2Samples.toUInt32(),
                sparseResidency4Samples: self.sparseResidency4Samples.toUInt32(),
                sparseResidency8Samples: self.sparseResidency8Samples.toUInt32(),
                sparseResidency16Samples: self.sparseResidency16Samples.toUInt32(),
                sparseResidencyAliased: self.sparseResidencyAliased.toUInt32(),
                variableMultisampleRate: self.variableMultisampleRate.toUInt32(),
                inheritedQueries: self.inheritedQueries.toUInt32()
        )
    }
}

public struct PhysicalDeviceMemoryProperties {
    public let memoryTypes: [MemoryType]
    public let memoryHeaps: [MemoryHeap]

    init(_ props: VkPhysicalDeviceMemoryProperties) {
        self.memoryTypes = convertTupleToArray(props.memoryTypes).map {
            MemoryType($0)
        }
        self.memoryHeaps = convertTupleToArray(props.memoryHeaps).map {
            MemoryHeap($0)
        }
    }
}
/*
public struct PhysicalDeviceProperties {
    public let apiVersion: UInt32
    public let driverVersion: UInt32
    public let vendorID: Int
    public let deviceID: Int
    public let deviceType: PhysicalDeviceType
    public let deviceName: String
    public let pipelineCacheUUID: [UInt8]
    let limits: Any? = nil // TODO: add later if needed
    let sparseProperties: Any? = nil // TODO: add later if needed
}*/
/*
public struct PushConstantRange: WrapperStruct {
    public var stageFlags: ShaderStageFlags = []
    public var offset = UInt32(0)
    public var size = UInt32(0)

    public var vulkan: VkPushConstantRange {
        VkPushConstantRange(
                stageFlags: self.stageFlags.rawValue,
                offset: self.offset,
                size: self.size
        )
    }
}*/

public struct QueueFamilyProperties {
    public let index: UInt32
    public let queueFlags: Flags
    public let queueCount: UInt32
    public let timestampValidBits: UInt32
    public let minImageTransferGranularity: Extent3D

    public init(index: UInt32,
                queueFlags: Flags,
                queueCount: UInt32,
                timestampValidBits: UInt32,
                minImageTransferGranularity: Extent3D) {
        self.index = index
        self.queueFlags = queueFlags
        self.queueCount = queueCount
        self.timestampValidBits = timestampValidBits
        self.minImageTransferGranularity = minImageTransferGranularity
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let graphicsBit = Flags(rawValue: 1 << 0)
        public static let computeBit = Flags(rawValue: 1 << 1)
        public static let transferBit = Flags(rawValue: 1 << 2)
        public static let sparseBindingBit = Flags(rawValue: 1 << 3)
        public static let protectedBit = Flags(rawValue: 1 << 4)
    }
}

public struct RenderPassCreateInfo {
    public let flags: Flags
    public let attachments: [AttachmentDescription]?
    public let subpasses: [SubpassDescription]?
    public let dependencies: [SubpassDependency]?

    public init(flags: Flags,
                attachments: [AttachmentDescription]?,
                subpasses: [SubpassDescription]?,
                dependencies: [SubpassDependency]?) {
        self.flags = flags
        self.attachments = attachments
        self.subpasses = subpasses
        self.dependencies = dependencies
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    mutating func toVulkan() -> VkRenderPassCreateInfo {
         VkRenderPassCreateInfo(
                sType: VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO,
                pNext: nil,
                flags: self.flags.rawValue,
                attachmentCount: UInt32(self.attachments?.count ?? 0),
                pAttachments: self.attachments?.vulkanPointer,
                subpassCount: UInt32(self.subpasses?.count ?? 0),
                pSubpasses: subpasses?.vulkanPointer,
                dependencyCount: UInt32(self.dependencies?.count ?? 0),
                pDependencies: dependencies?.vulkanPointer
        )
    }
}

public struct SemaphoreCreateInfo: WrapperStruct {

    public var flags: Flags

    public init(flags: Flags) {
        self.flags = flags
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    public var vulkan: VkSemaphoreCreateInfo {
        VkSemaphoreCreateInfo(
                sType: VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO,
                pNext: nil,
                flags: self.flags.rawValue
        )
    }
}
/*
public class SpecializationInfo {

}*/

public struct SurfaceCapabilities {
    public let minImageCount: UInt32
    public let maxImageCount: UInt32
    public let currentExtent: Extent2D
    public let minImageExtent: Extent2D
    public let maxImageExtent: Extent2D
    public let maxImageArrayLayers: UInt32
    public let supportedTransforms: SurfaceTransformFlags
    public let currentTransform: SurfaceTransformFlags
    public let supportedCompositeAlpha: CompositeAlphaFlags
    public let supportedUsageFlags: ImageUsageFlags

    init(fromVulkan capabilities: VkSurfaceCapabilitiesKHR) {
        self.minImageCount = capabilities.minImageCount
        self.maxImageCount = capabilities.maxImageCount
        self.currentExtent = Extent2D(fromVulkan: capabilities.currentExtent)
        self.minImageExtent = Extent2D(fromVulkan: capabilities.minImageExtent)
        self.maxImageExtent = Extent2D(fromVulkan: capabilities.maxImageExtent)
        self.maxImageArrayLayers = capabilities.maxImageArrayLayers
        self.supportedTransforms = SurfaceTransformFlags(rawValue: capabilities.supportedTransforms)
        self.currentTransform = SurfaceTransformFlags(rawValue: capabilities.currentTransform.rawValue)
        self.supportedCompositeAlpha = CompositeAlphaFlags(rawValue: capabilities.supportedCompositeAlpha)
        self.supportedUsageFlags = ImageUsageFlags(rawValue: capabilities.supportedUsageFlags)
    }
}

public struct SurfaceCreateInfo {
    #if os(macOS)
    let sType = VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK
    #elseif os(Linux)
    let sType = VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK // whatever it is for linux
    #endif
    // let next: Any? = nil
    public let flags: Flags
    public let view: UnsafeRawPointer?

    public init(flags: Flags,
                view: UnsafeRawPointer?) {
        self.flags = flags
        self.view = view
    }

    public struct Flags: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    /*
    func toVulkan() -> VkMacOSSurfaceCreateInfoMVK {
        return VkMacOSSurfaceCreateInfoMVK(
                sType: self.sType,
                pNext: nil,
                flags: UInt32(self.flags.rawValue),
                pView: self.view
        )
    }*/
    func toVulkan() -> Int {
        fatalError("not implemented")
    }
}

public struct SurfaceFormat {
    public let format: Format
    public let colorSpace: ColorSpace
}

public struct SwapchainCreateInfo {
    public let pNext: UnsafeRawPointer? = nil
    public let flags: Flags
    public let surface: SurfaceKHR
    public let minImageCount: UInt32
    public let imageFormat: Format
    public let imageColorSpace: ColorSpace
    public let imageExtent: Extent2D
    public let imageArrayLayers: UInt32
    public let imageUsage: ImageUsageFlags
    public let imageSharingMode: SharingMode
    public let queueFamilyIndices: [UInt32]
    public let preTransform: SurfaceTransformFlags
    public let compositeAlpha: CompositeAlphaFlags
    public let presentMode: PresentMode
    public let clipped: Bool
    public let oldSwapchain: Swapchain?

    public init(flags: Flags,
                surface: SurfaceKHR,
                minImageCount: UInt32,
                imageFormat: Format,
                imageColorSpace: ColorSpace,
                imageExtent: Extent2D,
                imageArrayLayers: UInt32,
                imageUsage: ImageUsageFlags,
                imageSharingMode: SharingMode,
                queueFamilyIndices: [UInt32],
                preTransform: SurfaceTransformFlags,
                compositeAlpha: CompositeAlphaFlags,
                presentMode: PresentMode,
                clipped: Bool,
                oldSwapchain: Swapchain? = nil) {
        self.flags = flags
        self.surface = surface
        self.minImageCount = minImageCount
        self.imageFormat = imageFormat
        self.imageColorSpace = imageColorSpace
        self.imageExtent = imageExtent
        self.imageArrayLayers = imageArrayLayers
        self.imageUsage = imageUsage
        self.imageSharingMode = imageSharingMode
        self.queueFamilyIndices = queueFamilyIndices
        self.preTransform = preTransform
        self.compositeAlpha = compositeAlpha
        self.presentMode = presentMode
        self.clipped = clipped
        self.oldSwapchain = oldSwapchain
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let splitInstanceBindRegions = Flags(rawValue: 1 << 0)
        public static let protected = Flags(rawValue: 1 << 1)
    }

    func toVulkan() -> VkSwapchainCreateInfoKHR {
        return VkSwapchainCreateInfoKHR(
                sType: VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
                pNext: self.pNext,
                flags: VkSwapchainCreateFlagsKHR(self.flags.rawValue),
                surface: self.surface.pointer,
                minImageCount: self.minImageCount,
                imageFormat: self.imageFormat.vulkan,
                imageColorSpace: self.imageColorSpace.vulkanValue,
                imageExtent: self.imageExtent.vulkan,
                imageArrayLayers: self.imageArrayLayers,
                imageUsage: self.imageUsage.rawValue,
                imageSharingMode: self.imageSharingMode.vulkanValue,
                queueFamilyIndexCount: UInt32(self.queueFamilyIndices.count),
                pQueueFamilyIndices: self.queueFamilyIndices,
                preTransform: self.preTransform.vulkan,
                compositeAlpha: self.compositeAlpha.vulkan,
                presentMode: self.presentMode.vulkan,
                clipped: self.clipped.vulkan,
                oldSwapchain: self.oldSwapchain?.pointer
        )
    }
}

/*public class WriteDescriptorSet {
    public let dstSet: DescriptorSet
    public let dstBinding: UInt32
    public let dstArrayElement: UInt32
    public let descriptorCount: UInt32
    public let descriptorType: DescriptorType
    public let imageInfo: DescriptorImageInfo?
    public let bufferInfo: DescriptorBufferInfo?
    public let texelBufferView: BufferView?

    public init(dstSet: DescriptorSet,
                dstBinding: UInt32,
                dstArrayElement: UInt32,
                descriptorCount: UInt32,
                descriptorType: DescriptorType,
                imageInfo: DescriptorImageInfo?,
                bufferInfo: DescriptorBufferInfo?,
                texelBufferView: BufferView?) {
        self.dstSet = dstSet
        self.dstBinding = dstBinding
        self.dstArrayElement = dstArrayElement
        self.descriptorCount = descriptorCount
        self.descriptorType = descriptorType
        self.imageInfo = imageInfo
        self.bufferInfo = bufferInfo
        self.texelBufferView = texelBufferView
    }

    private var pDescriptorImageInfo: [VkDescriptorImageInfo]? = nil
    private var pBufferInfo: [VkDescriptorBufferInfo]? = nil
    private var pTexelBufferView: [VkBufferView?]? = nil

    func toVulkan() -> VkWriteDescriptorSet {
        if self.imageInfo != nil {
            pDescriptorImageInfo = [self.imageInfo!.toVulkan()]
        } else {
            pDescriptorImageInfo = nil
        }

        if self.bufferInfo != nil {
            pBufferInfo = [self.bufferInfo!.toVulkan()]
        } else {
            pBufferInfo = nil
        }

        if self.texelBufferView != nil {
            pTexelBufferView = [self.texelBufferView?.vulkanValue]
        } else {
            pTexelBufferView = nil
        }

        let value = VkWriteDescriptorSet(
                sType: VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
                pNext: nil,
                dstSet: self.dstSet.pointer,
                dstBinding: self.dstBinding,
                dstArrayElement: self.dstArrayElement,
                descriptorCount: self.descriptorCount,
                descriptorType: self.descriptorType.vulkan,
                pImageInfo: pDescriptorImageInfo,
                pBufferInfo: pBufferInfo,
                pTexelBufferView: pTexelBufferView
        )

        return value;
    }
}*/

// This is not a Vulkan struct, but we're adding it to improve semantics
public struct Version {
    let major: Int
    let minor: Int
    let patch: Int

    var rawVersion: UInt32 {
        let val = (major << 22) | (minor << 12) | patch
        return UInt32(val)
    }

    public init(from rawValue: UInt32) {
        let val: Int = Int(rawValue)
        patch = val & 0xFFF
        minor = (val >> 12) & 0x3FF
        major = val >> 22
    }
}
