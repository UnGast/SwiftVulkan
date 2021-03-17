import CVulkan

public enum CompareOp: UInt32, VulkanEnumTypeWrapper {
  case never = 0,
less = 1,
equal = 2,
lessOrEqual = 3,
greater = 4,
notEqual = 5,
greaterOrEqual = 6,
always = 7

  public init(fromVulkan: VkCompareOp) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkCompareOp {
    VkCompareOp(rawValue)
  }
}