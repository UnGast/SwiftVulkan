import CVulkan

public enum FrontFace: UInt32 {
  case counterClockwise = 0
  case clockwise = 1

  public var vulkan: VkFrontFace {
    VkFrontFace(self.rawValue)
  }
}