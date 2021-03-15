import CVulkan

public enum CompareOp: UInt32 {
  case never = 0,
less = 1,
equal = 2,
lessOrEqual = 3,
greater = 4,
notEqual = 5,
greaterOrEqual = 6,
always = 7

  public var vulkan: VkCompareOp {
    VkCompareOp(rawValue)
  }
}