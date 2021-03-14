import CVulkan

public struct PipelineColorBlendAttachmentState: WrapperStruct {
  public var blendEnable: Bool
public var srcColorBlendFactor: BlendFactor
public var dstColorBlendFactor: BlendFactor
public var colorBlendOp: BlendOp
public var srcAlphaBlendFactor: BlendFactor
public var dstAlphaBlendFactor: BlendFactor
public var alphaBlendOp: BlendOp
public var colorWriteMask: ColorComponentFlags?

  

  public init(
    blendEnable: Bool,
srcColorBlendFactor: BlendFactor,
dstColorBlendFactor: BlendFactor,
colorBlendOp: BlendOp,
srcAlphaBlendFactor: BlendFactor,
dstAlphaBlendFactor: BlendFactor,
alphaBlendOp: BlendOp,
colorWriteMask: ColorComponentFlags?
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
    fatalError("use expVuklan on this type")
  }

  public var expVulkan: VkPipelineColorBlendAttachmentState {
    mutating get {
      
      return VkPipelineColorBlendAttachmentState(
        blendEnable: blendEnable.vulkan,
srcColorBlendFactor: srcColorBlendFactor.vulkan,
dstColorBlendFactor: dstColorBlendFactor.vulkan,
colorBlendOp: colorBlendOp.vulkan,
srcAlphaBlendFactor: srcAlphaBlendFactor.vulkan,
dstAlphaBlendFactor: dstAlphaBlendFactor.vulkan,
alphaBlendOp: alphaBlendOp.vulkan,
colorWriteMask: colorWriteMask?.vulkan
      )
    }
  }
}