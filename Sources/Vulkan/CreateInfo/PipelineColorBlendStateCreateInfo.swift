public struct PipelineColorBlendStateCreateInfo {
  public let logicOpEnable: Bool
  public let logicOp: LogicOp
  public let attachments: [PipelineColorBlendAttachmentState]
  public let blendConstants: [Float]

  public init(
    logicOpEnable: Bool,
    logicOp: LogicOp,
    attachments: [PipelineColorBlendAttachmentState],
    blendConstants: [Float]
  ) {
    self.logicOpEnable = logicOpEnable
    self.logicOp = logicOp
    self.attachments = attachments
    self.blendConstants = blendConstants
  }
}