import CVulkan

public struct PipelineColorBlendStateCreateInfo: WrapperStruct {
  public var flags: PipelineColorBlendStateCreateFlags?
public var logicOpEnable: Bool
public var logicOp: LogicOp
public var attachments: [PipelineColorBlendAttachmentState]
public var blendConstants: Float

  var vAttachments: [VkPipelineColorBlendAttachmentState]? = nil

  public init(
    flags: PipelineColorBlendStateCreateFlags?,
logicOpEnable: Bool,
logicOp: LogicOp,
attachments: [PipelineColorBlendAttachmentState],
blendConstants: Float
  ) {
    self.flags = flags
self.logicOpEnable = logicOpEnable
self.logicOp = logicOp
self.attachments = attachments
self.blendConstants = blendConstants
  }

  public var vulkan: VkPipelineColorBlendStateCreateInfo {
    fatalError("use expVuklan on this type")
  }

  public var expVulkan: VkPipelineColorBlendStateCreateInfo {
    mutating get {
      vAttachments = attachments.vulkanArray
      return VkPipelineColorBlendStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
logicOpEnable: logicOpEnable.vulkan,
logicOp: logicOp.vulkan,
attachmentCount: UInt32(attachments.count),
pAttachments: vAttachments,
blendConstants: blendConstants.vulkan
      )
    }
  }
}