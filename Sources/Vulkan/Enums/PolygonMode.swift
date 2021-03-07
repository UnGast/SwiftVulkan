import CVulkan

public enum PolygonMode: UInt32 {
  case fill = 0
  case line = 1
  case point = 2
  case fillRectangleNv = 1000153000

  public var vulkan: VkPolygonMode {
    VkPolygonMode(self.rawValue)
  }
}