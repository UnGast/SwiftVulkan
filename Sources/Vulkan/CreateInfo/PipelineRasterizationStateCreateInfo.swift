import CVulkan

public struct PipelineRasterizationStateCreateInfo: WrapperStruct {
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

  public var vulkan: VkPipelineRasterizationStateCreateInfo {
    VkPipelineRasterizationStateCreateInfo(
      sType: VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      depthClampEnable: depthClampEnable.vulkan,
      rasterizerDiscardEnable: rasterizerDiscardEnable.vulkan,
      polygonMode: polygonMode.vulkan,
      cullMode: cullMode.vulkan,
      frontFace: frontFace.vulkan,
      depthBiasEnable: depthBiasEnable.vulkan,
      depthBiasConstantFactor: depthBiasConstantFactor,
      depthBiasClamp: depthBiasClamp,
      depthBiasSlopeFactor: depthBiasSlopeFactor,
      lineWidth: lineWidth
    )
  }
}