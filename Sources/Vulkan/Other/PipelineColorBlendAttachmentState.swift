import CVulkan

public struct PipelineColorBlendAttachmentState {
  public let blendEnable: Bool
  public let srcColorBlendFactor: BlendFactor
  public let dstColorBlendFactor: BlendFactor
  public let colorBlendOp: VkBlendOp
  public let srcAlphaBlendFactor: BlendFactor
  public let dstAlphaBlendFactor: BlendFactor
  public let alphaBlendOp: VkBlendOp
  public let colorWriteMask: [ColorComponentFlag]

  public enum ColorComponentFlag {
    case r, g, b, a
  }

  public init(
    blendEnable: Bool,
    srcColorBlendFactor: BlendFactor,
    dstColorBlendFactor: BlendFactor,
    colorBlendOp: VkBlendOp,
    srcAlphaBlendFactor: BlendFactor,
    dstAlphaBlendFactor: BlendFactor,
    alphaBlendOp: VkBlendOp,
    colorWriteMask: [ColorComponentFlag]
  ) {
    self.blendEnable = blendEnable
    self.srcColorBlendFactor = srcColorBlendFactor
    self.dstColorBlendFactor = dstColorBlendFactor
    self.colorBlendOp = colorBlendOp
    self.srcAlphaBlendFactor = srcAlphaBlendFactor
    self.dstAlphaBlendFactor = dstAlphaBlendFactor
    self.alphaBlendOp = alphaBlendOp
    self.colorWriteMask = colorWriteMask
  }
}