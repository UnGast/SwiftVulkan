import CVulkan

public struct PipelineVertexInputStateCreateInfo: WrapperStruct {
  public let vertexBindingDescriptions: [VertexInputBindingDescription]?
  public let vertexAttributeDescriptions: [VertexInputAttributeDescription]?

  public init(vertexBindingDescriptions: [VertexInputBindingDescription]?, vertexAttributeDescriptions: [VertexInputAttributeDescription]?) {
    self.vertexBindingDescriptions = vertexBindingDescriptions
    self.vertexAttributeDescriptions = vertexAttributeDescriptions
  }

  public var vulkan: VkPipelineVertexInputStateCreateInfo {
    var info = VkPipelineVertexInputStateCreateInfo()
    info.sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
    info.pNext = nil
    info.vertexBindingDescriptionCount = UInt32(vertexBindingDescriptions?.count ?? 0)
    info.pVertexBindingDescriptions = vertexBindingDescriptions?.vulkanPointer
    info.vertexAttributeDescriptionCount = UInt32(vertexAttributeDescriptions?.count ?? 0)
    info.pVertexAttributeDescriptions = vertexAttributeDescriptions?.vulkanPointer
    return info
  }
}