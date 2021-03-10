import CVulkan

public struct VertexInputBindingDescription: WrapperStruct {
  public var binding: UInt32
  public var stride: UInt32
  public var inputRate: VertexInputRate

  public init(
    binding: UInt32,
    stride: UInt32,
    inputRate: VertexInputRate
  ) {
    self.binding = binding
    self.stride = stride
    self.inputRate = inputRate
  }

  public var vulkan: VkVertexInputBindingDescription {
    VkVertexInputBindingDescription(
      binding: binding,
      stride: stride,
      inputRate: inputRate.vulkan)
  }
}