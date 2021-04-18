import CVulkan

public struct PipelineVertexInputStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineVertexInputStateCreateFlags?
public var vertexBindingDescriptions: [VertexInputBindingDescription]
public var vertexAttributeDescriptions: [VertexInputAttributeDescription]

  var vNext: [Any]? = nil
var vVertexBindingDescriptions: [VkVertexInputBindingDescription]? = nil
var vVertexAttributeDescriptions: [VkVertexInputAttributeDescription]? = nil

  public init(
    next: Any? = nil,
flags: PipelineVertexInputStateCreateFlags? = nil,
vertexBindingDescriptions: [VertexInputBindingDescription],
vertexAttributeDescriptions: [VertexInputAttributeDescription]
  ) {
    self.next = next
self.flags = flags
self.vertexBindingDescriptions = vertexBindingDescriptions
self.vertexAttributeDescriptions = vertexAttributeDescriptions
  }

  public var vulkan: VkPipelineVertexInputStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vVertexBindingDescriptions = vertexBindingDescriptions.vulkanArray
vVertexAttributeDescriptions = vertexAttributeDescriptions.vulkanArray
      return VkPipelineVertexInputStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
vertexBindingDescriptionCount: UInt32(vertexBindingDescriptions.count),
pVertexBindingDescriptions: vVertexBindingDescriptions,
vertexAttributeDescriptionCount: UInt32(vertexAttributeDescriptions.count),
pVertexAttributeDescriptions: vVertexAttributeDescriptions
      )
    }
  }
}