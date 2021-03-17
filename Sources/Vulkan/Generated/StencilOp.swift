import CVulkan

public enum StencilOp: UInt32, VulkanEnumTypeWrapper {
  case keep = 0,
zero = 1,
replace = 2,
incrementAndClamp = 3,
decrementAndClamp = 4,
invert = 5,
incrementAndWrap = 6,
decrementAndWrap = 7

  public init(fromVulkan: VkStencilOp) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkStencilOp {
    VkStencilOp(rawValue)
  }
}