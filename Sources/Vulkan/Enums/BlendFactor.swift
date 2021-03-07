import CVulkan

public enum BlendFactor: UInt32 {
  case zero = 0
  case one = 1
  case srcColor = 2
  case oneMinusSrcColor = 3
  case dstColor = 4
  case oneMinusDstColor = 5
  case srcAlpha = 6
  case oneMinusSrcAlpha = 7
  case dstAlpha = 8
  case oneMinusDstAlpha = 9
  case constantColor = 10
  case oneMinusConstantColor = 11
  case constantAlpha = 12
  case oneMinusConstantAlpha = 13
  case alphaSaturate = 14
  case src1Color = 15
  case oneMinusSrc1Color = 16
  case src1Alpha = 17
  case oneMinusSrc1Alpha = 18

  public var vulkan: VkBlendFactor {
    VkBlendFactor(rawValue: self.rawValue)
  }
}