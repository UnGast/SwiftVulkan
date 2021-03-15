import CVulkan

public struct PhysicalDeviceLimits: VulkanTypeWrapper {
  /** max 1D image dimension */
public var maxImageDimension1D: UInt32
/** max 2D image dimension */
public var maxImageDimension2D: UInt32
/** max 3D image dimension */
public var maxImageDimension3D: UInt32
/** max cubemap image dimension */
public var maxImageDimensionCube: UInt32
/** max layers for image arrays */
public var maxImageArrayLayers: UInt32
/** max texel buffer size (fstexels) */
public var maxTexelBufferElements: UInt32
/** max uniform buffer range (bytes) */
public var maxUniformBufferRange: UInt32
/** max storage buffer range (bytes) */
public var maxStorageBufferRange: UInt32
/** max size of the push constants pool (bytes) */
public var maxPushConstantsSize: UInt32
/** max number of device memory allocations supported */
public var maxMemoryAllocationCount: UInt32
/** max number of samplers that can be allocated on a device */
public var maxSamplerAllocationCount: UInt32
/** Granularity (in bytes) at which buffers and images can be bound to adjacent memory for simultaneous usage */
public var bufferImageGranularity: DeviceSize
/** Total address space available for sparse allocations (bytes) */
public var sparseAddressSpaceSize: DeviceSize
/** max number of descriptors sets that can be bound to a pipeline */
public var maxBoundDescriptorSets: UInt32
/** max number of samplers allowed per-stage in a descriptor set */
public var maxPerStageDescriptorSamplers: UInt32
/** max number of uniform buffers allowed per-stage in a descriptor set */
public var maxPerStageDescriptorUniformBuffers: UInt32
/** max number of storage buffers allowed per-stage in a descriptor set */
public var maxPerStageDescriptorStorageBuffers: UInt32
/** max number of sampled images allowed per-stage in a descriptor set */
public var maxPerStageDescriptorSampledImages: UInt32
/** max number of storage images allowed per-stage in a descriptor set */
public var maxPerStageDescriptorStorageImages: UInt32
/** max number of input attachments allowed per-stage in a descriptor set */
public var maxPerStageDescriptorInputAttachments: UInt32
/** max number of resources allowed by a single stage */
public var maxPerStageResources: UInt32
/** max number of samplers allowed in all stages in a descriptor set */
public var maxDescriptorSetSamplers: UInt32
/** max number of uniform buffers allowed in all stages in a descriptor set */
public var maxDescriptorSetUniformBuffers: UInt32
/** max number of dynamic uniform buffers allowed in all stages in a descriptor set */
public var maxDescriptorSetUniformBuffersDynamic: UInt32
/** max number of storage buffers allowed in all stages in a descriptor set */
public var maxDescriptorSetStorageBuffers: UInt32
/** max number of dynamic storage buffers allowed in all stages in a descriptor set */
public var maxDescriptorSetStorageBuffersDynamic: UInt32
/** max number of sampled images allowed in all stages in a descriptor set */
public var maxDescriptorSetSampledImages: UInt32
/** max number of storage images allowed in all stages in a descriptor set */
public var maxDescriptorSetStorageImages: UInt32
/** max number of input attachments allowed in all stages in a descriptor set */
public var maxDescriptorSetInputAttachments: UInt32
/** max number of vertex input attribute slots */
public var maxVertexInputAttributes: UInt32
/** max number of vertex input binding slots */
public var maxVertexInputBindings: UInt32
/** max vertex input attribute offset added to vertex buffer offset */
public var maxVertexInputAttributeOffset: UInt32
/** max vertex input binding stride */
public var maxVertexInputBindingStride: UInt32
/** max number of output components written by vertex shader */
public var maxVertexOutputComponents: UInt32
/** max level supported by tessellation primitive generator */
public var maxTessellationGenerationLevel: UInt32
/** max patch size (vertices) */
public var maxTessellationPatchSize: UInt32
/** max number of input components per-vertex in TCS */
public var maxTessellationControlPerVertexInputComponents: UInt32
/** max number of output components per-vertex in TCS */
public var maxTessellationControlPerVertexOutputComponents: UInt32
/** max number of output components per-patch in TCS */
public var maxTessellationControlPerPatchOutputComponents: UInt32
/** max total number of per-vertex and per-patch output components in TCS */
public var maxTessellationControlTotalOutputComponents: UInt32
/** max number of input components per vertex in TES */
public var maxTessellationEvaluationInputComponents: UInt32
/** max number of output components per vertex in TES */
public var maxTessellationEvaluationOutputComponents: UInt32
/** max invocation count supported in geometry shader */
public var maxGeometryShaderInvocations: UInt32
/** max number of input components read in geometry stage */
public var maxGeometryInputComponents: UInt32
/** max number of output components written in geometry stage */
public var maxGeometryOutputComponents: UInt32
/** max number of vertices that can be emitted in geometry stage */
public var maxGeometryOutputVertices: UInt32
/** max total number of components (all vertices) written in geometry stage */
public var maxGeometryTotalOutputComponents: UInt32
/** max number of input components read in fragment stage */
public var maxFragmentInputComponents: UInt32
/** max number of output attachments written in fragment stage */
public var maxFragmentOutputAttachments: UInt32
/** max number of output attachments written when using dual source blending */
public var maxFragmentDualSrcAttachments: UInt32
/** max total number of storage buffers, storage images and output buffers */
public var maxFragmentCombinedOutputResources: UInt32
/** max total storage size of work group local storage (bytes) */
public var maxComputeSharedMemorySize: UInt32
/** max num of compute work groups that may be dispatched by a single command (x,y,z) */
public var maxComputeWorkGroupCount: (UInt32, UInt32, UInt32)
/** max total compute invocations in a single local work group */
public var maxComputeWorkGroupInvocations: UInt32
/** max local size of a compute work group (x,y,z) */
public var maxComputeWorkGroupSize: (UInt32, UInt32, UInt32)
/** number bits of subpixel precision in screen x and y */
public var subPixelPrecisionBits: UInt32
/** number bits of precision for selecting texel weights */
public var subTexelPrecisionBits: UInt32
/** number bits of precision for selecting mipmap weights */
public var mipmapPrecisionBits: UInt32
/** max index value for indexed draw calls (for 32-bit indices) */
public var maxDrawIndexedIndexValue: UInt32
/** max draw count for indirect draw calls */
public var maxDrawIndirectCount: UInt32
/** max absolute sampler LOD bias */
public var maxSamplerLodBias: Float
/** max degree of sampler anisotropy */
public var maxSamplerAnisotropy: Float
/** max number of active viewports */
public var maxViewports: UInt32
/** max viewport dimensions (x,y) */
public var maxViewportDimensions: (UInt32, UInt32)
/** viewport bounds range (min,max) */
public var viewportBoundsRange: (Float, Float)
/** number bits of subpixel precision for viewport */
public var viewportSubPixelBits: UInt32
/** min required alignment of pointers returned by MapMemory (bytes) */
public var minMemoryMapAlignment: SizeT
/** min required alignment for texel buffer offsets (bytes)  */
public var minTexelBufferOffsetAlignment: DeviceSize
/** min required alignment for uniform buffer sizes and offsets (bytes) */
public var minUniformBufferOffsetAlignment: DeviceSize
/** min required alignment for storage buffer offsets (bytes) */
public var minStorageBufferOffsetAlignment: DeviceSize
/** min texel offset for OpTextureSampleOffset */
public var minTexelOffset: Int32
/** max texel offset for OpTextureSampleOffset */
public var maxTexelOffset: UInt32
/** min texel offset for OpTextureGatherOffset */
public var minTexelGatherOffset: Int32
/** max texel offset for OpTextureGatherOffset */
public var maxTexelGatherOffset: UInt32
/** furthest negative offset for interpolateAtOffset */
public var minInterpolationOffset: Float
/** furthest positive offset for interpolateAtOffset */
public var maxInterpolationOffset: Float
/** number of subpixel bits for interpolateAtOffset */
public var subPixelInterpolationOffsetBits: UInt32
/** max width for a framebuffer */
public var maxFramebufferWidth: UInt32
/** max height for a framebuffer */
public var maxFramebufferHeight: UInt32
/** max layer count for a layered framebuffer */
public var maxFramebufferLayers: UInt32
/** supported color sample counts for a framebuffer */
public var framebufferColorSampleCounts: SampleCountFlags?
/** supported depth sample counts for a framebuffer */
public var framebufferDepthSampleCounts: SampleCountFlags?
/** supported stencil sample counts for a framebuffer */
public var framebufferStencilSampleCounts: SampleCountFlags?
/** supported sample counts for a subpass which uses no attachments */
public var framebufferNoAttachmentsSampleCounts: SampleCountFlags?
/** max number of color attachments per subpass */
public var maxColorAttachments: UInt32
/** supported color sample counts for a non-integer sampled image */
public var sampledImageColorSampleCounts: SampleCountFlags?
/** supported sample counts for an integer image */
public var sampledImageIntegerSampleCounts: SampleCountFlags?
/** supported depth sample counts for a sampled image */
public var sampledImageDepthSampleCounts: SampleCountFlags?
/** supported stencil sample counts for a sampled image */
public var sampledImageStencilSampleCounts: SampleCountFlags?
/** supported sample counts for a storage image */
public var storageImageSampleCounts: SampleCountFlags?
/** max number of sample mask words */
public var maxSampleMaskWords: UInt32
/** timestamps on graphics and compute queues */
public var timestampComputeAndGraphics: Bool
/** number of nanoseconds it takes for timestamp query value to increment by 1 */
public var timestampPeriod: Float
/** max number of clip distances */
public var maxClipDistances: UInt32
/** max number of cull distances */
public var maxCullDistances: UInt32
/** max combined number of user clipping */
public var maxCombinedClipAndCullDistances: UInt32
/** distinct queue priorities available  */
public var discreteQueuePriorities: UInt32
/** range (min,max) of supported point sizes */
public var pointSizeRange: (Float, Float)
/** range (min,max) of supported line widths */
public var lineWidthRange: (Float, Float)
/** granularity of supported point sizes */
public var pointSizeGranularity: Float
/** granularity of supported line widths */
public var lineWidthGranularity: Float
/** line rasterization follows preferred rules */
public var strictLines: Bool
/** supports standard sample locations for all supported sample counts */
public var standardSampleLocations: Bool
/** optimal offset of buffer copies */
public var optimalBufferCopyOffsetAlignment: DeviceSize
/** optimal pitch of buffer copies */
public var optimalBufferCopyRowPitchAlignment: DeviceSize
/** minimum size and alignment for non-coherent host-mapped device memory access */
public var nonCoherentAtomSize: DeviceSize

  

  public init(
    maxImageDimension1D: UInt32,
maxImageDimension2D: UInt32,
maxImageDimension3D: UInt32,
maxImageDimensionCube: UInt32,
maxImageArrayLayers: UInt32,
maxTexelBufferElements: UInt32,
maxUniformBufferRange: UInt32,
maxStorageBufferRange: UInt32,
maxPushConstantsSize: UInt32,
maxMemoryAllocationCount: UInt32,
maxSamplerAllocationCount: UInt32,
bufferImageGranularity: DeviceSize,
sparseAddressSpaceSize: DeviceSize,
maxBoundDescriptorSets: UInt32,
maxPerStageDescriptorSamplers: UInt32,
maxPerStageDescriptorUniformBuffers: UInt32,
maxPerStageDescriptorStorageBuffers: UInt32,
maxPerStageDescriptorSampledImages: UInt32,
maxPerStageDescriptorStorageImages: UInt32,
maxPerStageDescriptorInputAttachments: UInt32,
maxPerStageResources: UInt32,
maxDescriptorSetSamplers: UInt32,
maxDescriptorSetUniformBuffers: UInt32,
maxDescriptorSetUniformBuffersDynamic: UInt32,
maxDescriptorSetStorageBuffers: UInt32,
maxDescriptorSetStorageBuffersDynamic: UInt32,
maxDescriptorSetSampledImages: UInt32,
maxDescriptorSetStorageImages: UInt32,
maxDescriptorSetInputAttachments: UInt32,
maxVertexInputAttributes: UInt32,
maxVertexInputBindings: UInt32,
maxVertexInputAttributeOffset: UInt32,
maxVertexInputBindingStride: UInt32,
maxVertexOutputComponents: UInt32,
maxTessellationGenerationLevel: UInt32,
maxTessellationPatchSize: UInt32,
maxTessellationControlPerVertexInputComponents: UInt32,
maxTessellationControlPerVertexOutputComponents: UInt32,
maxTessellationControlPerPatchOutputComponents: UInt32,
maxTessellationControlTotalOutputComponents: UInt32,
maxTessellationEvaluationInputComponents: UInt32,
maxTessellationEvaluationOutputComponents: UInt32,
maxGeometryShaderInvocations: UInt32,
maxGeometryInputComponents: UInt32,
maxGeometryOutputComponents: UInt32,
maxGeometryOutputVertices: UInt32,
maxGeometryTotalOutputComponents: UInt32,
maxFragmentInputComponents: UInt32,
maxFragmentOutputAttachments: UInt32,
maxFragmentDualSrcAttachments: UInt32,
maxFragmentCombinedOutputResources: UInt32,
maxComputeSharedMemorySize: UInt32,
maxComputeWorkGroupCount: (UInt32, UInt32, UInt32),
maxComputeWorkGroupInvocations: UInt32,
maxComputeWorkGroupSize: (UInt32, UInt32, UInt32),
subPixelPrecisionBits: UInt32,
subTexelPrecisionBits: UInt32,
mipmapPrecisionBits: UInt32,
maxDrawIndexedIndexValue: UInt32,
maxDrawIndirectCount: UInt32,
maxSamplerLodBias: Float,
maxSamplerAnisotropy: Float,
maxViewports: UInt32,
maxViewportDimensions: (UInt32, UInt32),
viewportBoundsRange: (Float, Float),
viewportSubPixelBits: UInt32,
minMemoryMapAlignment: SizeT,
minTexelBufferOffsetAlignment: DeviceSize,
minUniformBufferOffsetAlignment: DeviceSize,
minStorageBufferOffsetAlignment: DeviceSize,
minTexelOffset: Int32,
maxTexelOffset: UInt32,
minTexelGatherOffset: Int32,
maxTexelGatherOffset: UInt32,
minInterpolationOffset: Float,
maxInterpolationOffset: Float,
subPixelInterpolationOffsetBits: UInt32,
maxFramebufferWidth: UInt32,
maxFramebufferHeight: UInt32,
maxFramebufferLayers: UInt32,
framebufferColorSampleCounts: SampleCountFlags? = nil,
framebufferDepthSampleCounts: SampleCountFlags? = nil,
framebufferStencilSampleCounts: SampleCountFlags? = nil,
framebufferNoAttachmentsSampleCounts: SampleCountFlags? = nil,
maxColorAttachments: UInt32,
sampledImageColorSampleCounts: SampleCountFlags? = nil,
sampledImageIntegerSampleCounts: SampleCountFlags? = nil,
sampledImageDepthSampleCounts: SampleCountFlags? = nil,
sampledImageStencilSampleCounts: SampleCountFlags? = nil,
storageImageSampleCounts: SampleCountFlags? = nil,
maxSampleMaskWords: UInt32,
timestampComputeAndGraphics: Bool,
timestampPeriod: Float,
maxClipDistances: UInt32,
maxCullDistances: UInt32,
maxCombinedClipAndCullDistances: UInt32,
discreteQueuePriorities: UInt32,
pointSizeRange: (Float, Float),
lineWidthRange: (Float, Float),
pointSizeGranularity: Float,
lineWidthGranularity: Float,
strictLines: Bool,
standardSampleLocations: Bool,
optimalBufferCopyOffsetAlignment: DeviceSize,
optimalBufferCopyRowPitchAlignment: DeviceSize,
nonCoherentAtomSize: DeviceSize
  ) {
    self.maxImageDimension1D = maxImageDimension1D
self.maxImageDimension2D = maxImageDimension2D
self.maxImageDimension3D = maxImageDimension3D
self.maxImageDimensionCube = maxImageDimensionCube
self.maxImageArrayLayers = maxImageArrayLayers
self.maxTexelBufferElements = maxTexelBufferElements
self.maxUniformBufferRange = maxUniformBufferRange
self.maxStorageBufferRange = maxStorageBufferRange
self.maxPushConstantsSize = maxPushConstantsSize
self.maxMemoryAllocationCount = maxMemoryAllocationCount
self.maxSamplerAllocationCount = maxSamplerAllocationCount
self.bufferImageGranularity = bufferImageGranularity
self.sparseAddressSpaceSize = sparseAddressSpaceSize
self.maxBoundDescriptorSets = maxBoundDescriptorSets
self.maxPerStageDescriptorSamplers = maxPerStageDescriptorSamplers
self.maxPerStageDescriptorUniformBuffers = maxPerStageDescriptorUniformBuffers
self.maxPerStageDescriptorStorageBuffers = maxPerStageDescriptorStorageBuffers
self.maxPerStageDescriptorSampledImages = maxPerStageDescriptorSampledImages
self.maxPerStageDescriptorStorageImages = maxPerStageDescriptorStorageImages
self.maxPerStageDescriptorInputAttachments = maxPerStageDescriptorInputAttachments
self.maxPerStageResources = maxPerStageResources
self.maxDescriptorSetSamplers = maxDescriptorSetSamplers
self.maxDescriptorSetUniformBuffers = maxDescriptorSetUniformBuffers
self.maxDescriptorSetUniformBuffersDynamic = maxDescriptorSetUniformBuffersDynamic
self.maxDescriptorSetStorageBuffers = maxDescriptorSetStorageBuffers
self.maxDescriptorSetStorageBuffersDynamic = maxDescriptorSetStorageBuffersDynamic
self.maxDescriptorSetSampledImages = maxDescriptorSetSampledImages
self.maxDescriptorSetStorageImages = maxDescriptorSetStorageImages
self.maxDescriptorSetInputAttachments = maxDescriptorSetInputAttachments
self.maxVertexInputAttributes = maxVertexInputAttributes
self.maxVertexInputBindings = maxVertexInputBindings
self.maxVertexInputAttributeOffset = maxVertexInputAttributeOffset
self.maxVertexInputBindingStride = maxVertexInputBindingStride
self.maxVertexOutputComponents = maxVertexOutputComponents
self.maxTessellationGenerationLevel = maxTessellationGenerationLevel
self.maxTessellationPatchSize = maxTessellationPatchSize
self.maxTessellationControlPerVertexInputComponents = maxTessellationControlPerVertexInputComponents
self.maxTessellationControlPerVertexOutputComponents = maxTessellationControlPerVertexOutputComponents
self.maxTessellationControlPerPatchOutputComponents = maxTessellationControlPerPatchOutputComponents
self.maxTessellationControlTotalOutputComponents = maxTessellationControlTotalOutputComponents
self.maxTessellationEvaluationInputComponents = maxTessellationEvaluationInputComponents
self.maxTessellationEvaluationOutputComponents = maxTessellationEvaluationOutputComponents
self.maxGeometryShaderInvocations = maxGeometryShaderInvocations
self.maxGeometryInputComponents = maxGeometryInputComponents
self.maxGeometryOutputComponents = maxGeometryOutputComponents
self.maxGeometryOutputVertices = maxGeometryOutputVertices
self.maxGeometryTotalOutputComponents = maxGeometryTotalOutputComponents
self.maxFragmentInputComponents = maxFragmentInputComponents
self.maxFragmentOutputAttachments = maxFragmentOutputAttachments
self.maxFragmentDualSrcAttachments = maxFragmentDualSrcAttachments
self.maxFragmentCombinedOutputResources = maxFragmentCombinedOutputResources
self.maxComputeSharedMemorySize = maxComputeSharedMemorySize
self.maxComputeWorkGroupCount = maxComputeWorkGroupCount
self.maxComputeWorkGroupInvocations = maxComputeWorkGroupInvocations
self.maxComputeWorkGroupSize = maxComputeWorkGroupSize
self.subPixelPrecisionBits = subPixelPrecisionBits
self.subTexelPrecisionBits = subTexelPrecisionBits
self.mipmapPrecisionBits = mipmapPrecisionBits
self.maxDrawIndexedIndexValue = maxDrawIndexedIndexValue
self.maxDrawIndirectCount = maxDrawIndirectCount
self.maxSamplerLodBias = maxSamplerLodBias
self.maxSamplerAnisotropy = maxSamplerAnisotropy
self.maxViewports = maxViewports
self.maxViewportDimensions = maxViewportDimensions
self.viewportBoundsRange = viewportBoundsRange
self.viewportSubPixelBits = viewportSubPixelBits
self.minMemoryMapAlignment = minMemoryMapAlignment
self.minTexelBufferOffsetAlignment = minTexelBufferOffsetAlignment
self.minUniformBufferOffsetAlignment = minUniformBufferOffsetAlignment
self.minStorageBufferOffsetAlignment = minStorageBufferOffsetAlignment
self.minTexelOffset = minTexelOffset
self.maxTexelOffset = maxTexelOffset
self.minTexelGatherOffset = minTexelGatherOffset
self.maxTexelGatherOffset = maxTexelGatherOffset
self.minInterpolationOffset = minInterpolationOffset
self.maxInterpolationOffset = maxInterpolationOffset
self.subPixelInterpolationOffsetBits = subPixelInterpolationOffsetBits
self.maxFramebufferWidth = maxFramebufferWidth
self.maxFramebufferHeight = maxFramebufferHeight
self.maxFramebufferLayers = maxFramebufferLayers
self.framebufferColorSampleCounts = framebufferColorSampleCounts
self.framebufferDepthSampleCounts = framebufferDepthSampleCounts
self.framebufferStencilSampleCounts = framebufferStencilSampleCounts
self.framebufferNoAttachmentsSampleCounts = framebufferNoAttachmentsSampleCounts
self.maxColorAttachments = maxColorAttachments
self.sampledImageColorSampleCounts = sampledImageColorSampleCounts
self.sampledImageIntegerSampleCounts = sampledImageIntegerSampleCounts
self.sampledImageDepthSampleCounts = sampledImageDepthSampleCounts
self.sampledImageStencilSampleCounts = sampledImageStencilSampleCounts
self.storageImageSampleCounts = storageImageSampleCounts
self.maxSampleMaskWords = maxSampleMaskWords
self.timestampComputeAndGraphics = timestampComputeAndGraphics
self.timestampPeriod = timestampPeriod
self.maxClipDistances = maxClipDistances
self.maxCullDistances = maxCullDistances
self.maxCombinedClipAndCullDistances = maxCombinedClipAndCullDistances
self.discreteQueuePriorities = discreteQueuePriorities
self.pointSizeRange = pointSizeRange
self.lineWidthRange = lineWidthRange
self.pointSizeGranularity = pointSizeGranularity
self.lineWidthGranularity = lineWidthGranularity
self.strictLines = strictLines
self.standardSampleLocations = standardSampleLocations
self.optimalBufferCopyOffsetAlignment = optimalBufferCopyOffsetAlignment
self.optimalBufferCopyRowPitchAlignment = optimalBufferCopyRowPitchAlignment
self.nonCoherentAtomSize = nonCoherentAtomSize
  }

  public init(fromVulkan vulkan: VkPhysicalDeviceLimits) {
    self.init(
      maxImageDimension1D: UInt32(fromVulkan: vulkan.maxImageDimension1D),
maxImageDimension2D: UInt32(fromVulkan: vulkan.maxImageDimension2D),
maxImageDimension3D: UInt32(fromVulkan: vulkan.maxImageDimension3D),
maxImageDimensionCube: UInt32(fromVulkan: vulkan.maxImageDimensionCube),
maxImageArrayLayers: UInt32(fromVulkan: vulkan.maxImageArrayLayers),
maxTexelBufferElements: UInt32(fromVulkan: vulkan.maxTexelBufferElements),
maxUniformBufferRange: UInt32(fromVulkan: vulkan.maxUniformBufferRange),
maxStorageBufferRange: UInt32(fromVulkan: vulkan.maxStorageBufferRange),
maxPushConstantsSize: UInt32(fromVulkan: vulkan.maxPushConstantsSize),
maxMemoryAllocationCount: UInt32(fromVulkan: vulkan.maxMemoryAllocationCount),
maxSamplerAllocationCount: UInt32(fromVulkan: vulkan.maxSamplerAllocationCount),
bufferImageGranularity: DeviceSize(fromVulkan: vulkan.bufferImageGranularity),
sparseAddressSpaceSize: DeviceSize(fromVulkan: vulkan.sparseAddressSpaceSize),
maxBoundDescriptorSets: UInt32(fromVulkan: vulkan.maxBoundDescriptorSets),
maxPerStageDescriptorSamplers: UInt32(fromVulkan: vulkan.maxPerStageDescriptorSamplers),
maxPerStageDescriptorUniformBuffers: UInt32(fromVulkan: vulkan.maxPerStageDescriptorUniformBuffers),
maxPerStageDescriptorStorageBuffers: UInt32(fromVulkan: vulkan.maxPerStageDescriptorStorageBuffers),
maxPerStageDescriptorSampledImages: UInt32(fromVulkan: vulkan.maxPerStageDescriptorSampledImages),
maxPerStageDescriptorStorageImages: UInt32(fromVulkan: vulkan.maxPerStageDescriptorStorageImages),
maxPerStageDescriptorInputAttachments: UInt32(fromVulkan: vulkan.maxPerStageDescriptorInputAttachments),
maxPerStageResources: UInt32(fromVulkan: vulkan.maxPerStageResources),
maxDescriptorSetSamplers: UInt32(fromVulkan: vulkan.maxDescriptorSetSamplers),
maxDescriptorSetUniformBuffers: UInt32(fromVulkan: vulkan.maxDescriptorSetUniformBuffers),
maxDescriptorSetUniformBuffersDynamic: UInt32(fromVulkan: vulkan.maxDescriptorSetUniformBuffersDynamic),
maxDescriptorSetStorageBuffers: UInt32(fromVulkan: vulkan.maxDescriptorSetStorageBuffers),
maxDescriptorSetStorageBuffersDynamic: UInt32(fromVulkan: vulkan.maxDescriptorSetStorageBuffersDynamic),
maxDescriptorSetSampledImages: UInt32(fromVulkan: vulkan.maxDescriptorSetSampledImages),
maxDescriptorSetStorageImages: UInt32(fromVulkan: vulkan.maxDescriptorSetStorageImages),
maxDescriptorSetInputAttachments: UInt32(fromVulkan: vulkan.maxDescriptorSetInputAttachments),
maxVertexInputAttributes: UInt32(fromVulkan: vulkan.maxVertexInputAttributes),
maxVertexInputBindings: UInt32(fromVulkan: vulkan.maxVertexInputBindings),
maxVertexInputAttributeOffset: UInt32(fromVulkan: vulkan.maxVertexInputAttributeOffset),
maxVertexInputBindingStride: UInt32(fromVulkan: vulkan.maxVertexInputBindingStride),
maxVertexOutputComponents: UInt32(fromVulkan: vulkan.maxVertexOutputComponents),
maxTessellationGenerationLevel: UInt32(fromVulkan: vulkan.maxTessellationGenerationLevel),
maxTessellationPatchSize: UInt32(fromVulkan: vulkan.maxTessellationPatchSize),
maxTessellationControlPerVertexInputComponents: UInt32(fromVulkan: vulkan.maxTessellationControlPerVertexInputComponents),
maxTessellationControlPerVertexOutputComponents: UInt32(fromVulkan: vulkan.maxTessellationControlPerVertexOutputComponents),
maxTessellationControlPerPatchOutputComponents: UInt32(fromVulkan: vulkan.maxTessellationControlPerPatchOutputComponents),
maxTessellationControlTotalOutputComponents: UInt32(fromVulkan: vulkan.maxTessellationControlTotalOutputComponents),
maxTessellationEvaluationInputComponents: UInt32(fromVulkan: vulkan.maxTessellationEvaluationInputComponents),
maxTessellationEvaluationOutputComponents: UInt32(fromVulkan: vulkan.maxTessellationEvaluationOutputComponents),
maxGeometryShaderInvocations: UInt32(fromVulkan: vulkan.maxGeometryShaderInvocations),
maxGeometryInputComponents: UInt32(fromVulkan: vulkan.maxGeometryInputComponents),
maxGeometryOutputComponents: UInt32(fromVulkan: vulkan.maxGeometryOutputComponents),
maxGeometryOutputVertices: UInt32(fromVulkan: vulkan.maxGeometryOutputVertices),
maxGeometryTotalOutputComponents: UInt32(fromVulkan: vulkan.maxGeometryTotalOutputComponents),
maxFragmentInputComponents: UInt32(fromVulkan: vulkan.maxFragmentInputComponents),
maxFragmentOutputAttachments: UInt32(fromVulkan: vulkan.maxFragmentOutputAttachments),
maxFragmentDualSrcAttachments: UInt32(fromVulkan: vulkan.maxFragmentDualSrcAttachments),
maxFragmentCombinedOutputResources: UInt32(fromVulkan: vulkan.maxFragmentCombinedOutputResources),
maxComputeSharedMemorySize: UInt32(fromVulkan: vulkan.maxComputeSharedMemorySize),
maxComputeWorkGroupCount: vulkan.maxComputeWorkGroupCount,
maxComputeWorkGroupInvocations: UInt32(fromVulkan: vulkan.maxComputeWorkGroupInvocations),
maxComputeWorkGroupSize: vulkan.maxComputeWorkGroupSize,
subPixelPrecisionBits: UInt32(fromVulkan: vulkan.subPixelPrecisionBits),
subTexelPrecisionBits: UInt32(fromVulkan: vulkan.subTexelPrecisionBits),
mipmapPrecisionBits: UInt32(fromVulkan: vulkan.mipmapPrecisionBits),
maxDrawIndexedIndexValue: UInt32(fromVulkan: vulkan.maxDrawIndexedIndexValue),
maxDrawIndirectCount: UInt32(fromVulkan: vulkan.maxDrawIndirectCount),
maxSamplerLodBias: Float(fromVulkan: vulkan.maxSamplerLodBias),
maxSamplerAnisotropy: Float(fromVulkan: vulkan.maxSamplerAnisotropy),
maxViewports: UInt32(fromVulkan: vulkan.maxViewports),
maxViewportDimensions: vulkan.maxViewportDimensions,
viewportBoundsRange: vulkan.viewportBoundsRange,
viewportSubPixelBits: UInt32(fromVulkan: vulkan.viewportSubPixelBits),
minMemoryMapAlignment: SizeT(fromVulkan: vulkan.minMemoryMapAlignment),
minTexelBufferOffsetAlignment: DeviceSize(fromVulkan: vulkan.minTexelBufferOffsetAlignment),
minUniformBufferOffsetAlignment: DeviceSize(fromVulkan: vulkan.minUniformBufferOffsetAlignment),
minStorageBufferOffsetAlignment: DeviceSize(fromVulkan: vulkan.minStorageBufferOffsetAlignment),
minTexelOffset: Int32(fromVulkan: vulkan.minTexelOffset),
maxTexelOffset: UInt32(fromVulkan: vulkan.maxTexelOffset),
minTexelGatherOffset: Int32(fromVulkan: vulkan.minTexelGatherOffset),
maxTexelGatherOffset: UInt32(fromVulkan: vulkan.maxTexelGatherOffset),
minInterpolationOffset: Float(fromVulkan: vulkan.minInterpolationOffset),
maxInterpolationOffset: Float(fromVulkan: vulkan.maxInterpolationOffset),
subPixelInterpolationOffsetBits: UInt32(fromVulkan: vulkan.subPixelInterpolationOffsetBits),
maxFramebufferWidth: UInt32(fromVulkan: vulkan.maxFramebufferWidth),
maxFramebufferHeight: UInt32(fromVulkan: vulkan.maxFramebufferHeight),
maxFramebufferLayers: UInt32(fromVulkan: vulkan.maxFramebufferLayers),
framebufferColorSampleCounts: SampleCountFlags(fromVulkan: vulkan.framebufferColorSampleCounts),
framebufferDepthSampleCounts: SampleCountFlags(fromVulkan: vulkan.framebufferDepthSampleCounts),
framebufferStencilSampleCounts: SampleCountFlags(fromVulkan: vulkan.framebufferStencilSampleCounts),
framebufferNoAttachmentsSampleCounts: SampleCountFlags(fromVulkan: vulkan.framebufferNoAttachmentsSampleCounts),
maxColorAttachments: UInt32(fromVulkan: vulkan.maxColorAttachments),
sampledImageColorSampleCounts: SampleCountFlags(fromVulkan: vulkan.sampledImageColorSampleCounts),
sampledImageIntegerSampleCounts: SampleCountFlags(fromVulkan: vulkan.sampledImageIntegerSampleCounts),
sampledImageDepthSampleCounts: SampleCountFlags(fromVulkan: vulkan.sampledImageDepthSampleCounts),
sampledImageStencilSampleCounts: SampleCountFlags(fromVulkan: vulkan.sampledImageStencilSampleCounts),
storageImageSampleCounts: SampleCountFlags(fromVulkan: vulkan.storageImageSampleCounts),
maxSampleMaskWords: UInt32(fromVulkan: vulkan.maxSampleMaskWords),
timestampComputeAndGraphics: Bool(fromVulkan: vulkan.timestampComputeAndGraphics),
timestampPeriod: Float(fromVulkan: vulkan.timestampPeriod),
maxClipDistances: UInt32(fromVulkan: vulkan.maxClipDistances),
maxCullDistances: UInt32(fromVulkan: vulkan.maxCullDistances),
maxCombinedClipAndCullDistances: UInt32(fromVulkan: vulkan.maxCombinedClipAndCullDistances),
discreteQueuePriorities: UInt32(fromVulkan: vulkan.discreteQueuePriorities),
pointSizeRange: vulkan.pointSizeRange,
lineWidthRange: vulkan.lineWidthRange,
pointSizeGranularity: Float(fromVulkan: vulkan.pointSizeGranularity),
lineWidthGranularity: Float(fromVulkan: vulkan.lineWidthGranularity),
strictLines: Bool(fromVulkan: vulkan.strictLines),
standardSampleLocations: Bool(fromVulkan: vulkan.standardSampleLocations),
optimalBufferCopyOffsetAlignment: DeviceSize(fromVulkan: vulkan.optimalBufferCopyOffsetAlignment),
optimalBufferCopyRowPitchAlignment: DeviceSize(fromVulkan: vulkan.optimalBufferCopyRowPitchAlignment),
nonCoherentAtomSize: DeviceSize(fromVulkan: vulkan.nonCoherentAtomSize)
    )
  }

  public var vulkan: VkPhysicalDeviceLimits {
    mutating get {
      fatalError("PhysicalDeviceLimits is a return-only type")
    }
  }
}