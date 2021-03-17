/*
import CVulkan

public struct PipelineVertexInputStateCreateInfo: WrapperStruct {
  public var vertexBindingDescriptions: [VertexInputBindingDescription]?
  public var vertexAttributeDescriptions: [VertexInputAttributeDescription]?

  var vVertexBindingDescriptions: [VkVertexInputBindingDescription]? = nil
  var vVertexAttributeDescriptions: [VkVertexInputAttributeDescription]? = nil

  public init(vertexBindingDescriptions: [VertexInputBindingDescription]?, vertexAttributeDescriptions: [VertexInputAttributeDescription]?) {
    self.vertexBindingDescriptions = vertexBindingDescriptions
    self.vertexAttributeDescriptions = vertexAttributeDescriptions
  }

  public var vulkan: VkPipelineVertexInputStateCreateInfo {
    return VkPipelineVertexInputStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
        pNext: nil,
        flags: 0,
        vertexBindingDescriptionCount: UInt32(vertexBindingDescriptions?.count ?? 0),
        pVertexBindingDescriptions: vertexBindingDescriptions?.vulkanPointer,
        vertexAttributeDescriptionCount: UInt32(vertexAttributeDescriptions?.count ?? 0),
        pVertexAttributeDescriptions: vertexAttributeDescriptions?.vulkanPointer
      )
  }

  public var expVulkan: VkPipelineVertexInputStateCreateInfo {
     mutating get {
      vVertexBindingDescriptions = vertexBindingDescriptions?.vulkanArray
      vVertexAttributeDescriptions = vertexAttributeDescriptions?.vulkanArray

      return VkPipelineVertexInputStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
        pNext: nil,
        flags: 0,
        vertexBindingDescriptionCount: UInt32(vertexBindingDescriptions?.count ?? 0),
        pVertexBindingDescriptions: vVertexBindingDescriptions,
        vertexAttributeDescriptionCount: UInt32(vertexAttributeDescriptions?.count ?? 0),
        pVertexAttributeDescriptions: vVertexAttributeDescriptions
      )
    }
  }
}*/