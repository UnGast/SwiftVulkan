import CVulkan

public struct PipelineDynamicStateCreateInfo: WrapperStruct {
  public let dynamicStates: [DynamicState]

  public init(dynamicStates: [DynamicState]) {
    self.dynamicStates = dynamicStates
  }

  public var vulkan: VkPipelineDynamicStateCreateInfo {
    VkPipelineDynamicStateCreateInfo(
      sType: VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      dynamicStateCount: UInt32(dynamicStates.count),
      pDynamicStates: dynamicStates.vulkanPointer
    )
  }
}