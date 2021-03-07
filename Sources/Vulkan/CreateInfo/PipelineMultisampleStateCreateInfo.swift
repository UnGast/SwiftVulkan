import CVulkan

public struct PipelineMultisampleStateCreateInfo: WrapperStruct {
  public let rasterizationSamples: SampleCountFlags
  public let sampleShadingEnable: Bool
  public let minSampleShading: Float
  public let sampleMask: SampleMask?
  public let alphaToCoverageEnable: Bool
  public let alphaToOneEnable: Bool

  public init(
    rasterizationSamples: SampleCountFlags,
    sampleShadingEnable: Bool,
    minSampleShading: Float,
    sampleMask: SampleMask?,
    alphaToCoverageEnable: Bool,
    alphaToOneEnable: Bool
  ) {
    self.rasterizationSamples = rasterizationSamples
    self.sampleShadingEnable = sampleShadingEnable
    self.minSampleShading = minSampleShading
    self.sampleMask = sampleMask
    self.alphaToCoverageEnable = alphaToCoverageEnable
    self.alphaToOneEnable = alphaToOneEnable
  }

  public var vulkan: VkPipelineMultisampleStateCreateInfo {
    VkPipelineMultisampleStateCreateInfo(
      sType: VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      rasterizationSamples: rasterizationSamples.vulkanValue,
      sampleShadingEnable: sampleShadingEnable.vulkan,
      minSampleShading: minSampleShading,
      pSampleMask: nil,
      alphaToCoverageEnable: alphaToCoverageEnable.vulkan,
      alphaToOneEnable: alphaToOneEnable.vulkan
    )
  }
}