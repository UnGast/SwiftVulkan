import CVulkan

public struct PipelineViewportStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineViewportStateCreateFlags?
public var viewports: [Viewport]?
public var scissors: [Rect2D]?

  var vViewports: [VkViewport]? = nil
var vScissors: [VkRect2D]? = nil

  public init(
    flags: PipelineViewportStateCreateFlags? = nil,
viewports: [Viewport]? = nil,
scissors: [Rect2D]? = nil
  ) {
    self.flags = flags
self.viewports = viewports
self.scissors = scissors
  }

  public var vulkan: VkPipelineViewportStateCreateInfo {
    mutating get {
      vViewports = viewports?.vulkanArray
vScissors = scissors?.vulkanArray
      return VkPipelineViewportStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
viewportCount: UInt32(viewports?.count ?? 0),
pViewports: vViewports,
scissorCount: UInt32(scissors?.count ?? 0),
pScissors: vScissors
      )
    }
  }
}