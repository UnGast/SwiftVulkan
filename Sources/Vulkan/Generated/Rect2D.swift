import CVulkan

public struct Rect2D: VulkanTypeWrapper {
  public var offset: Offset2D
public var extent: Extent2D

  

  public init(
    offset: Offset2D,
extent: Extent2D
  ) {
    self.offset = offset
self.extent = extent
  }

  public var vulkan: VkRect2D {
    mutating get {
      
      return VkRect2D(
        offset: offset.vulkan,
extent: extent.vulkan
      )
    }
  }
}