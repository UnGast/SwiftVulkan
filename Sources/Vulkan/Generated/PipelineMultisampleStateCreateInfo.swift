import CVulkan

public struct PipelineMultisampleStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineMultisampleStateCreateFlags?
/** Number of samples used for rasterization */
public var rasterizationSamples: SampleCountFlagBits
/** optional (GL45) */
public var sampleShadingEnable: Bool
/** optional (GL45) */
public var minSampleShading: Float
public var sampleMask: [SampleMask]?
public var alphaToCoverageEnable: Bool
public var alphaToOneEnable: Bool

  var vSampleMask: [VkSampleMask]? = nil

  public init(
    flags: PipelineMultisampleStateCreateFlags? = nil,
rasterizationSamples: SampleCountFlagBits,
sampleShadingEnable: Bool,
minSampleShading: Float,
sampleMask: [SampleMask]? = nil,
alphaToCoverageEnable: Bool,
alphaToOneEnable: Bool
  ) {
    self.flags = flags
self.rasterizationSamples = rasterizationSamples
self.sampleShadingEnable = sampleShadingEnable
self.minSampleShading = minSampleShading
self.sampleMask = sampleMask
self.alphaToCoverageEnable = alphaToCoverageEnable
self.alphaToOneEnable = alphaToOneEnable
  }

  public var vulkan: VkPipelineMultisampleStateCreateInfo {
    mutating get {
      vSampleMask = sampleMask?.vulkanArray
      return VkPipelineMultisampleStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
rasterizationSamples: rasterizationSamples.vulkan,
sampleShadingEnable: sampleShadingEnable.vulkan,
minSampleShading: minSampleShading.vulkan,
pSampleMask: vSampleMask,
alphaToCoverageEnable: alphaToCoverageEnable.vulkan,
alphaToOneEnable: alphaToOneEnable.vulkan
      )
    }
  }
}