import CVulkan

public struct RenderPassBeginInfo: WrapperStruct {
  public var renderPass: RenderPass
  public var framebuffer: Framebuffer
  public var renderArea: Rect2D
  public var clearValues: [AnyClearValue]

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
    VkRenderPassBeginInfo(
      sType: VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
      pNext: nil,
      renderPass: renderPass.pointer,
      framebuffer: framebuffer.pointer,
      renderArea: renderArea.vulkan,
      clearValueCount: UInt32(clearValues.count),
      pClearValues: clearValues.vulkanPointer
    )
  }
}