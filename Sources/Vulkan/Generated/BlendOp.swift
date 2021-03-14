import CVulkan

public enum BlendOp: UInt32 {
  case add = 0,
subtract = 1,
reverseSubtract = 2,
min = 3,
max = 4

  public var vulkan: VkBlendOp {
    VkBlendOp(rawValue)
  }
}