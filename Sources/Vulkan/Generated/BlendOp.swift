import CVulkan

public enum BlendOp: UInt32, VulkanEnumTypeWrapper {
  case add = 0,
subtract = 1,
reverseSubtract = 2,
min = 3,
max = 4

  public init(fromVulkan: VkBlendOp) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkBlendOp {
    VkBlendOp(rawValue)
  }
}