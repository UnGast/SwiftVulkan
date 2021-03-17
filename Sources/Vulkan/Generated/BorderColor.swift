import CVulkan

public enum BorderColor: UInt32, VulkanEnumTypeWrapper {
  case floatTransparentBlack = 0,
intTransparentBlack = 1,
floatOpaqueBlack = 2,
intOpaqueBlack = 3,
floatOpaqueWhite = 4,
intOpaqueWhite = 5

  public init(fromVulkan: VkBorderColor) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkBorderColor {
    VkBorderColor(rawValue)
  }
}