import CVulkan

public struct PipelineVertexInputStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineVertexInputStateCreateFlags?
public var vertexBindingDescriptions: [VertexInputBindingDescription]
public var vertexAttributeDescriptions: [VertexInputAttributeDescription]

  var vVertexBindingDescriptions: [VkVertexInputBindingDescription]? = nil
var vVertexAttributeDescriptions: [VkVertexInputAttributeDescription]? = nil

  public init(
    flags: PipelineVertexInputStateCreateFlags? = nil,
vertexBindingDescriptions: [VertexInputBindingDescription],
vertexAttributeDescriptions: [VertexInputAttributeDescription]
  ) {
    self.flags = flags
self.vertexBindingDescriptions = vertexBindingDescriptions
self.vertexAttributeDescriptions = vertexAttributeDescriptions
  }

  public var vulkan: VkPipelineVertexInputStateCreateInfo {
    mutating get {
      vVertexBindingDescriptions = vertexBindingDescriptions.vulkanArray
vVertexAttributeDescriptions = vertexAttributeDescriptions.vulkanArray
      return VkPipelineVertexInputStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
vertexBindingDescriptionCount: UInt32(vertexBindingDescriptions.count),
pVertexBindingDescriptions: vVertexBindingDescriptions,
vertexAttributeDescriptionCount: UInt32(vertexAttributeDescriptions.count),
pVertexAttributeDescriptions: vVertexAttributeDescriptions
      )
    }
  }
}