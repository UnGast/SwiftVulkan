/*import CVulkan

public struct PipelineColorBlendAttachmentState: WrapperStruct {
  public let blendEnable: Bool
  public let srcColorBlendFactor: BlendFactor
  public let dstColorBlendFactor: BlendFactor
  public let colorBlendOp: VkBlendOp
  public let srcAlphaBlendFactor: BlendFactor
  public let dstAlphaBlendFactor: BlendFactor
  public let alphaBlendOp: VkBlendOp
  public let colorWriteMask: Set<ColorComponentFlag>

  public init(
    blendEnable: Bool,
    srcColorBlendFactor: BlendFactor,
    dstColorBlendFactor: BlendFactor,
    colorBlendOp: VkBlendOp,
    srcAlphaBlendFactor: BlendFactor,
    dstAlphaBlendFactor: BlendFactor,
    alphaBlendOp: VkBlendOp,
    colorWriteMask: Set<ColorComponentFlag>
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

  public var vulkan: VkPipelineColorBlendAttachmentState {
    VkPipelineColorBlendAttachmentState(
      blendEnable: blendEnable.vulkan,
      srcColorBlendFactor: srcColorBlendFactor.vulkan,
      dstColorBlendFactor: dstColorBlendFactor.vulkan,
      colorBlendOp: colorBlendOp,
      srcAlphaBlendFactor: srcAlphaBlendFactor.vulkan,
      dstAlphaBlendFactor: dstAlphaBlendFactor.vulkan,
      alphaBlendOp: alphaBlendOp,
      colorWriteMask: colorWriteMask.vulkan
    )
  }
}*/