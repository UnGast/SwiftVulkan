import CVulkan

public struct GraphicsPipelineCreateInfo: VulkanTypeWrapper {
  /** Pipeline creation flags */
public var flags: PipelineCreateFlags?
public var stages: [PipelineShaderStageCreateInfo]
public var vertexInputState: PipelineVertexInputStateCreateInfo?
public var inputAssemblyState: PipelineInputAssemblyStateCreateInfo?
public var tessellationState: PipelineTessellationStateCreateInfo?
public var viewportState: PipelineViewportStateCreateInfo?
public var rasterizationState: PipelineRasterizationStateCreateInfo
public var multisampleState: PipelineMultisampleStateCreateInfo?
public var depthStencilState: PipelineDepthStencilStateCreateInfo?
public var colorBlendState: PipelineColorBlendStateCreateInfo?
public var dynamicState: PipelineDynamicStateCreateInfo?
/** Interface layout of the pipeline */
public var layout: PipelineLayout
public var renderPass: RenderPass
public var subpass: UInt32
/** If VK_PIPELINE_CREATE_DERIVATIVE_BIT is set and this value is nonzero, it specifies the handle of the base pipeline this is a derivative of */
public var basePipelineHandle: Pipeline?
/** If VK_PIPELINE_CREATE_DERIVATIVE_BIT is set and this value is not -1, it specifies an index into pCreateInfos of the base pipeline this is a derivative of */
public var basePipelineIndex: Int32

  var vStages: [VkPipelineShaderStageCreateInfo]? = nil
var vVertexInputState: [VkPipelineVertexInputStateCreateInfo]? = nil
var vInputAssemblyState: [VkPipelineInputAssemblyStateCreateInfo]? = nil
var vTessellationState: [VkPipelineTessellationStateCreateInfo]? = nil
var vViewportState: [VkPipelineViewportStateCreateInfo]? = nil
var vRasterizationState: [VkPipelineRasterizationStateCreateInfo]? = nil
var vMultisampleState: [VkPipelineMultisampleStateCreateInfo]? = nil
var vDepthStencilState: [VkPipelineDepthStencilStateCreateInfo]? = nil
var vColorBlendState: [VkPipelineColorBlendStateCreateInfo]? = nil
var vDynamicState: [VkPipelineDynamicStateCreateInfo]? = nil

  public init(
    flags: PipelineCreateFlags? = nil,
stages: [PipelineShaderStageCreateInfo],
vertexInputState: PipelineVertexInputStateCreateInfo? = nil,
inputAssemblyState: PipelineInputAssemblyStateCreateInfo? = nil,
tessellationState: PipelineTessellationStateCreateInfo? = nil,
viewportState: PipelineViewportStateCreateInfo? = nil,
rasterizationState: PipelineRasterizationStateCreateInfo,
multisampleState: PipelineMultisampleStateCreateInfo? = nil,
depthStencilState: PipelineDepthStencilStateCreateInfo? = nil,
colorBlendState: PipelineColorBlendStateCreateInfo? = nil,
dynamicState: PipelineDynamicStateCreateInfo? = nil,
layout: PipelineLayout,
renderPass: RenderPass,
subpass: UInt32,
basePipelineHandle: Pipeline? = nil,
basePipelineIndex: Int32
  ) {
    self.flags = flags
self.stages = stages
self.vertexInputState = vertexInputState
self.inputAssemblyState = inputAssemblyState
self.tessellationState = tessellationState
self.viewportState = viewportState
self.rasterizationState = rasterizationState
self.multisampleState = multisampleState
self.depthStencilState = depthStencilState
self.colorBlendState = colorBlendState
self.dynamicState = dynamicState
self.layout = layout
self.renderPass = renderPass
self.subpass = subpass
self.basePipelineHandle = basePipelineHandle
self.basePipelineIndex = basePipelineIndex
  }

  public var vulkan: VkGraphicsPipelineCreateInfo {
    mutating get {
      vStages = stages.vulkanArray
vVertexInputState = vertexInputState?.vulkanArray
vInputAssemblyState = inputAssemblyState?.vulkanArray
vTessellationState = tessellationState?.vulkanArray
vViewportState = viewportState?.vulkanArray
vRasterizationState = rasterizationState.vulkanArray
vMultisampleState = multisampleState?.vulkanArray
vDepthStencilState = depthStencilState?.vulkanArray
vColorBlendState = colorBlendState?.vulkanArray
vDynamicState = dynamicState?.vulkanArray
      return VkGraphicsPipelineCreateInfo(
        sType: VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
stageCount: UInt32(stages.count),
pStages: vStages,
pVertexInputState: vVertexInputState,
pInputAssemblyState: vInputAssemblyState,
pTessellationState: vTessellationState,
pViewportState: vViewportState,
pRasterizationState: vRasterizationState,
pMultisampleState: vMultisampleState,
pDepthStencilState: vDepthStencilState,
pColorBlendState: vColorBlendState,
pDynamicState: vDynamicState,
layout: layout.vulkan,
renderPass: renderPass.vulkan,
subpass: subpass.vulkan,
basePipelineHandle: basePipelineHandle?.vulkan,
basePipelineIndex: basePipelineIndex.vulkan
      )
    }
  }
}