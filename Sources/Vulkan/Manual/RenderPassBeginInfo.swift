import CVulkan

public struct RenderPassBeginInfo: VulkanTypeWrapper {
  public var renderPass: RenderPass
public var framebuffer: Framebuffer
public var renderArea: Rect2D
public var clearValues: [AnyClearValue]

  var vClearValues: [VkClearValue]? = nil

  public init(
    renderPass: RenderPass,
framebuffer: Framebuffer,
renderArea: Rect2D,
clearValues: [AnyClearValue]
  ) {
    self.renderPass = renderPass
self.framebuffer = framebuffer
self.renderArea = renderArea
self.clearValues = clearValues
  }

  public var vulkan: VkRenderPassBeginInfo {
    mutating get {
      vClearValues = clearValues.vulkanArray
      return VkRenderPassBeginInfo(
        sType: VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
pNext: nil,
renderPass: renderPass.vulkan,
framebuffer: framebuffer.vulkan,
renderArea: renderArea.vulkan,
clearValueCount: UInt32(clearValues.count),
pClearValues: vClearValues
      )
    }
  }
}