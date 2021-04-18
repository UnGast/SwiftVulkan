import CVulkan

public struct PipelineLayoutCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineLayoutCreateFlags?
public var setLayouts: [DescriptorSetLayout]
public var pushConstantRanges: [PushConstantRange]

  var vNext: [Any]? = nil
var vSetLayouts: [VkDescriptorSetLayout?]? = nil
var vPushConstantRanges: [VkPushConstantRange]? = nil

  public init(
    next: Any? = nil,
flags: PipelineLayoutCreateFlags? = nil,
setLayouts: [DescriptorSetLayout],
pushConstantRanges: [PushConstantRange]
  ) {
    self.next = next
self.flags = flags
self.setLayouts = setLayouts
self.pushConstantRanges = pushConstantRanges
  }

  public var vulkan: VkPipelineLayoutCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vSetLayouts = setLayouts.vulkanArray
vPushConstantRanges = pushConstantRanges.vulkanArray
      return VkPipelineLayoutCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
setLayoutCount: UInt32(setLayouts.count),
pSetLayouts: vSetLayouts,
pushConstantRangeCount: UInt32(pushConstantRanges.count),
pPushConstantRanges: vPushConstantRanges
      )
    }
  }
}