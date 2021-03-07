import CVulkan

public struct Rect2D: WrapperStruct {
  public let offset: Offset2D
  public let extent: Extent2D

  public init(offset: Offset2D, extent: Extent2D) {
    self.offset = offset
    self.extent = extent
  }

  public var vulkan: VkRect2D {
    VkRect2D(
      offset: offset.vulkan,
      extent: extent.vulkan
    )
  }
}