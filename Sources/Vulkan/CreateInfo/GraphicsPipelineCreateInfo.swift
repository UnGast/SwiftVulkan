import CVulkan

public struct GraphicsPipelineCreateInfo: WrapperStruct {
  public var flags: UInt32
  public var stages: [PipelineShaderStageCreateInfo]
  public var vertexInputState: PipelineVertexInputStateCreateInfo?
  public var inputAssemblyState: PipelineInputAssemblyStateCreateInfo?
  public var tessellationState: Void
  public var viewportState: PipelineViewportStateCreateInfo
  public var rasterizationState: PipelineRasterizationStateCreateInfo
  public var multisampleState: PipelineMultisampleStateCreateInfo
  public var depthStencilState: Void
  public var colorBlendState: PipelineColorBlendStateCreateInfo?
  public var dynamicState: PipelineDynamicStateCreateInfo?
  public var layout: PipelineLayout
  public var renderPass: RenderPass
  public var subpass: UInt32

  var vStages: [VkPipelineShaderStageCreateInfo]? = nil
  var vInputState: [VkPipelineVertexInputStateCreateInfo]? = nil

  public init(
    flags: UInt32,
    stages: [PipelineShaderStageCreateInfo],
    vertexInputState: PipelineVertexInputStateCreateInfo?,
    inputAssemblyState: PipelineInputAssemblyStateCreateInfo?,
    tessellationState: Void,
    viewportState: PipelineViewportStateCreateInfo,
    rasterizationState: PipelineRasterizationStateCreateInfo,
    multisampleState: PipelineMultisampleStateCreateInfo,
    depthStencilState: Void,
    colorBlendState: PipelineColorBlendStateCreateInfo?,
    dynamicState: PipelineDynamicStateCreateInfo?,
    layout: PipelineLayout,
    renderPass: RenderPass,
    subpass: UInt32
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
  }

  public var vulkan: VkGraphicsPipelineCreateInfo { VkGraphicsPipelineCreateInfo() }

  public var expVulkan: VkGraphicsPipelineCreateInfo {
    mutating get {
      vStages = stages.vulkanArray
      vInputState = vertexInputState?.vulkanArray

      return VkGraphicsPipelineCreateInfo(
        sType: VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
        pNext: nil,
        flags: 0,
        stageCount: UInt32(stages.count),
        pStages: vStages,
        pVertexInputState: vInputState,//UnsafePointer(vertexInputState?.vulkan),//vertexInputState != nil ? Optional([vertexInputState!.vulkan]) : nil,
        pInputAssemblyState: inputAssemblyState?.vulkanPointer,//inputAssemblyState != nil ? Optional([inputAssemblyState!.vulkan]) : nil,
        pTessellationState: nil,
        pViewportState: viewportState.vulkanPointer,
        pRasterizationState: rasterizationState.vulkanPointer,
        pMultisampleState: multisampleState.vulkanPointer,
        pDepthStencilState: nil,
        pColorBlendState: colorBlendState?.vulkanPointer,//colorBlendState != nil ? Optional([colorBlendState!.vulkan]) : nil,
        pDynamicState: dynamicState?.vulkanPointer,//dynamicState != nil ? Optional([dynamicState!.vulkan]) : nil,
        layout: layout.vulkan,
        renderPass: renderPass.vulkan,
        subpass: subpass,
        basePipelineHandle: nil,
        basePipelineIndex: 0
      )
    }
  }
}