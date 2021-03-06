public struct Rect2D {
  public let offset: Offset2D
  public let extent: Extent2D

  public init(offset: Offset2D, extent: Extent2D) {
    self.offset = offset
    self.extent = extent
  }
}