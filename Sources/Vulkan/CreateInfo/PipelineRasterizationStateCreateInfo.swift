public struct PipelineRasterizationStateCreateInfo {
  public let depthClampEnable: Bool
  public let rasterizerDiscardEnable: Bool
  public let polygonMode: PolygonMode
  public let cullMode: CullMode
  public let frontFace: FrontFace
  public let depthBiasEnable: Bool
  public let depthBiasConstantFactor: Float
  public let depthBiasClamp: Float
  public let depthBiasSlopeFactor: Float
  public let lineWidth: Float

  public init(
    depthClampEnable: Bool,
    rasterizerDiscardEnable: Bool,
    polygonMode: PolygonMode,
    cullMode: CullMode,
    frontFace: FrontFace,
    depthBiasEnable: Bool,
    depthBiasConstantFactor: Float,
    depthBiasClamp: Float,
    depthBiasSlopeFactor: Float,
    lineWidth: Float
  ) {
    self.depthClampEnable = depthClampEnable
    self.rasterizerDiscardEnable = rasterizerDiscardEnable
    self.polygonMode = polygonMode
    self.cullMode = cullMode
    self.frontFace = frontFace
    self.depthBiasEnable = depthBiasEnable
    self.depthBiasConstantFactor = depthBiasConstantFactor
    self.depthBiasClamp = depthBiasClamp
    self.depthBiasSlopeFactor = depthBiasSlopeFactor
    self.lineWidth = lineWidth
  }
}