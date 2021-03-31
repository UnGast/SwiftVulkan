import CVulkan

public struct PipelineLayoutCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineLayoutCreateFlags?
public var setLayouts: [DescriptorSetLayout]
public var pushConstantRanges: [PushConstantRange]

  var vPushConstantRanges: [VkPushConstantRange]? = nil

  public init(
    flags: PipelineLayoutCreateFlags? = nil,
setLayouts: [DescriptorSetLayout],
pushConstantRanges: [PushConstantRange]
  ) {
    self.flags = flags
self.setLayouts = setLayouts
self.pushConstantRanges = pushConstantRanges
  }

  public var vulkan: VkPipelineLayoutCreateInfo {
    mutating get {
      vPushConstantRanges = pushConstantRanges.vulkanArray
      return VkPipelineLayoutCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
setLayoutCount: UInt32(setLayouts.count),
pSetLayouts: setLayouts.vulkan,
pushConstantRangeCount: UInt32(pushConstantRanges.count),
pPushConstantRanges: vPushConstantRanges
      )
    }
  }
}