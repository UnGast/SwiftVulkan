/*import CVulkan

public struct PipelineColorBlendStateCreateInfo: WrapperStruct {
  public let logicOpEnable: Bool
  public let logicOp: LogicOp
  public let attachments: [PipelineColorBlendAttachmentState]
  public let blendConstants: (Float, Float, Float, Float)

  public init(
    logicOpEnable: Bool,
    logicOp: LogicOp,
    attachments: [PipelineColorBlendAttachmentState],
    blendConstants: (Float, Float, Float, Float)
  ) {
    self.logicOpEnable = logicOpEnable
    self.logicOp = logicOp
    self.attachments = attachments
    self.blendConstants = blendConstants
  }

  public var vulkan: VkPipelineColorBlendStateCreateInfo {
    VkPipelineColorBlendStateCreateInfo(
      sType: VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      logicOpEnable: logicOpEnable.vulkan,
      logicOp: logicOp.vulkan,
      attachmentCount: UInt32(attachments.count),
      pAttachments: attachments.vulkanPointer,
      blendConstants: blendConstants
    )
  }
}*/