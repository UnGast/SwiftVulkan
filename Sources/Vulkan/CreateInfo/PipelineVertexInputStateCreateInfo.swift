import CVulkan

public struct PipelineVertexInputStateCreateInfo {
  public let vertexBindingDescriptions: [VertexBindingDescription]
  public let vertexAttributeDescriptions: [VertexAttributeDescription]

  public init(vertexBindingDescriptions: [VertexBindingDescription], vertexAttributeDescriptions: [VertexAttributeDescription]) {
    self.vertexBindingDescriptions = vertexBindingDescriptions
    self.vertexAttributeDescriptions = vertexAttributeDescriptions
  }

  public var vulkan: VkPipelineVertexInputStateCreateInfo {
    var info = VkPipelineVertexInputStateCreateInfo()
    info.sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
    info.pNext = nil
    info.vertexBindingDescriptionCount = UInt32(vertexBindingDescriptions.count)
    info.pVertexBindingDescriptions = nil
    info.vertexAttributeDescriptionCount = UInt32(vertexBindingDescriptions.count)
    info.pVertexAttributeDescriptions = nil
    return info
  }
}