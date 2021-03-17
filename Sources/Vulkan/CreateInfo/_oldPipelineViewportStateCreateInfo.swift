/*
import CVulkan

public struct PipelineViewportStateCreateInfo: WrapperStruct {
  public let viewports: [Viewport]
  public let scissors: [Rect2D]

  public init(viewports: [Viewport], scissors: [Rect2D]) {
    self.viewports = viewports
    self.scissors = scissors
  }

  public var vulkan: VkPipelineViewportStateCreateInfo {
    return VkPipelineViewportStateCreateInfo(
      sType: VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      viewportCount: UInt32(viewports.count),
      pViewports: viewports.vulkanPointer,
      scissorCount: UInt32(scissors.count),
      pScissors: scissors.vulkanPointer
    )
  }
}*/