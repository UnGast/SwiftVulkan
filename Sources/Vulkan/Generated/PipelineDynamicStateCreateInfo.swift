import CVulkan

public struct PipelineDynamicStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineDynamicStateCreateFlags?
public var dynamicStates: [DynamicState]

  var vDynamicStates: [VkDynamicState]? = nil

  public init(
    flags: PipelineDynamicStateCreateFlags? = nil,
dynamicStates: [DynamicState]
  ) {
    self.flags = flags
self.dynamicStates = dynamicStates
  }

  public var vulkan: VkPipelineDynamicStateCreateInfo {
    mutating get {
      vDynamicStates = dynamicStates.vulkanArray
      return VkPipelineDynamicStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
dynamicStateCount: UInt32(dynamicStates.count),
pDynamicStates: vDynamicStates
      )
    }
  }
}