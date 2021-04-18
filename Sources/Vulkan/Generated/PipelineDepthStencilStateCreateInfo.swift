import CVulkan

public struct PipelineDepthStencilStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineDepthStencilStateCreateFlags?
public var depthTestEnable: Bool
public var depthWriteEnable: Bool
public var depthCompareOp: CompareOp
/** optional (depth_bounds_test) */
public var depthBoundsTestEnable: Bool
public var stencilTestEnable: Bool
public var front: StencilOpState
public var back: StencilOpState
public var minDepthBounds: Float
public var maxDepthBounds: Float

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: PipelineDepthStencilStateCreateFlags? = nil,
depthTestEnable: Bool,
depthWriteEnable: Bool,
depthCompareOp: CompareOp,
depthBoundsTestEnable: Bool,
stencilTestEnable: Bool,
front: StencilOpState,
back: StencilOpState,
minDepthBounds: Float,
maxDepthBounds: Float
  ) {
    self.next = next
self.flags = flags
self.depthTestEnable = depthTestEnable
self.depthWriteEnable = depthWriteEnable
self.depthCompareOp = depthCompareOp
self.depthBoundsTestEnable = depthBoundsTestEnable
self.stencilTestEnable = stencilTestEnable
self.front = front
self.back = back
self.minDepthBounds = minDepthBounds
self.maxDepthBounds = maxDepthBounds
  }

  public var vulkan: VkPipelineDepthStencilStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkPipelineDepthStencilStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
depthTestEnable: depthTestEnable.vulkan,
depthWriteEnable: depthWriteEnable.vulkan,
depthCompareOp: depthCompareOp.vulkan,
depthBoundsTestEnable: depthBoundsTestEnable.vulkan,
stencilTestEnable: stencilTestEnable.vulkan,
front: front.vulkan,
back: back.vulkan,
minDepthBounds: minDepthBounds.vulkan,
maxDepthBounds: maxDepthBounds.vulkan
      )
    }
  }
}