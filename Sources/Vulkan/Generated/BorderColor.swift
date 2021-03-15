import CVulkan

public enum BorderColor: UInt32 {
  case floatTransparentBlack = 0,
intTransparentBlack = 1,
floatOpaqueBlack = 2,
intOpaqueBlack = 3,
floatOpaqueWhite = 4,
intOpaqueWhite = 5

  public var vulkan: VkBorderColor {
    VkBorderColor(rawValue)
  }
}