import CVulkan

public struct Viewport: WrapperStruct {
  public let x: Float
  public let y: Float
  public let width: Float
  public let height: Float
  public let minDepth: Float
  public let maxDepth: Float

  public init(x: Float, y: Float, width: Float, height: Float, minDepth: Float, maxDepth: Float) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.minDepth = minDepth
    self.maxDepth = maxDepth
  }

  public var vulkan: VkViewport {
    VkViewport(
      x: x,
      y: y,
      width: width,
      height: height,
      minDepth: minDepth,
      maxDepth: maxDepth
    )
  }
}