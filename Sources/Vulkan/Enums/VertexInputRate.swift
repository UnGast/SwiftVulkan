import CVulkan

public enum VertexInputRate: UInt32, WrapperStruct {
  case vertex = 0, instance = 1

  public var vulkan: VkVertexInputRate {
    VkVertexInputRate(rawValue)
  }
}