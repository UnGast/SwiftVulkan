import CVulkan

public struct Offset2D: WrapperStruct {
  public let x: Int32
  public let y: Int32

  public init(x: Int32, y: Int32) {
    self.x = x
    self.y = y
  }

  public var vulkan: VkOffset2D {
    VkOffset2D(
      x: x,
      y: y
    )
  }
}