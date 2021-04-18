import CVulkan

public enum VertexInputRate: UInt32 {
  case vertex = 0, instance = 1

  public var vulkan: VkVertexInputRate {
    VkVertexInputRate(rawValue)
  }
}