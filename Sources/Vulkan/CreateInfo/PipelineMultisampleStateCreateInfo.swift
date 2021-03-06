public struct PipelineMultisampleStateCreateInfo {
  public let rasterizationSamples: SampleCount
  public let sampleShadingEnable: Bool
  public let minSampleShading: Float
  public let sampleMask: SampleMask?
  public let alphaToCoverageEnable: Bool
  public let alphaToOneEnable: Bool

  public init(
    rasterizationSamples: SampleCount,
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
}