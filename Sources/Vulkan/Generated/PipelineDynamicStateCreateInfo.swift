import CVulkan

public struct PipelineDynamicStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineDynamicStateCreateFlags?
public var dynamicStates: [DynamicState]

  var vNext: [Any]? = nil
var vDynamicStates: [VkDynamicState]? = nil

  public init(
    next: Any? = nil,
flags: PipelineDynamicStateCreateFlags? = nil,
dynamicStates: [DynamicState]
  ) {
    self.next = next
self.flags = flags
self.dynamicStates = dynamicStates
  }

  public var vulkan: VkPipelineDynamicStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vDynamicStates = dynamicStates.vulkanArray
      return VkPipelineDynamicStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
dynamicStateCount: UInt32(dynamicStates.count),
pDynamicStates: vDynamicStates
      )
    }
  }
}