import CVulkan

public struct PipelineDynamicStateCreateInfo {
  public let dynamicStates: [VkDynamicState]

  public init(dynamicStates: [VkDynamicState]) {
    self.dynamicStates = dynamicStates
  }
}