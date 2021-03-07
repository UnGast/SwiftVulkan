import CVulkan

public struct GraphicsPipelineCreateInfo {
  public let flags: UInt32
  public let stages: [PipelineShaderStageCreateInfo]
  public let vertexInputSate: PipelineVertexInputStateCreateInfo
  public let inputAssemblyState: PipelineInputAssemblyStateCreateInfo
  public let tessellationState: Void
  public let viewportState: PipelineViewportStateCreateInfo
  public let rasterizationState: PipelineRasterizationStateCreateInfo
  public let multisampleState: PipelineMultisampleStateCreateInfo
  public let depthStencilState: Void
  public let colorBlendState: PipelineColorBlendStateCreateInfo
  public let dynamicState: PipelineDynamicStateCreateInfo?
  public let layout: PipelineLayout
  public let renderPass: RenderPass
  public let subpass: UInt32

  public init(
    flags: UInt32,
    stages: [PipelineShaderStageCreateInfo],
    vertexInputSate: PipelineVertexInputStateCreateInfo,
    inputAssemblyState: PipelineInputAssemblyStateCreateInfo,
    tessellationState: Void,
    viewportState: PipelineViewportStateCreateInfo,
    rasterizationState: PipelineRasterizationStateCreateInfo,
    multisampleState: PipelineMultisampleStateCreateInfo,
    depthStencilState: Void,
    colorBlendState: PipelineColorBlendStateCreateInfo,
    dynamicState: PipelineDynamicStateCreateInfo?,
    layout: PipelineLayout,
    renderPass: RenderPass,
    subpass: UInt32
  ) {
    self.flags = flags
    self.stages = stages
    self.vertexInputSate = vertexInputSate
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
  }

  public var vulkan: VkGraphicsPipelineCreateInfo {
    return VkGraphicsPipelineCreateInfo(
      sType: VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
      pNext: nil,
      flags: 0,
      stageCount: UInt32(stages.count),
      pStages: stages.vulkanPointer,
      pVertexInputState: vertexInputSate.vulkanPointer,
      pInputAssemblyState: inputAssemblyState.vulkanPointer,
      pTessellationState: nil,
      pViewportState: viewportState.vulkanPointer,
      pRasterizationState: rasterizationState.vulkanPointer,
      pMultisampleState: multisampleState.vulkanPointer,
      pDepthStencilState: nil,
      pColorBlendState: colorBlendState.vulkanPointer,
      pDynamicState: dynamicState?.vulkanPointer,
      layout: layout.vulkanValue,
      renderPass: renderPass.vulkanValue,
      subpass: subpass,
      basePipelineHandle: nil,
      basePipelineIndex: 0
    )
  }
}