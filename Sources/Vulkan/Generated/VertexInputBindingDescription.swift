import CVulkan

public struct VertexInputBindingDescription: VulkanTypeWrapper {
  /** Vertex buffer binding id */
public var binding: UInt32
/** Distance between vertices in bytes (0 = no advancement) */
public var stride: UInt32
/** The rate at which the vertex data is consumed */
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
    mutating get {
      
      return VkVertexInputBindingDescription(
        binding: binding.vulkan,
stride: stride.vulkan,
inputRate: inputRate.vulkan
      )
    }
  }
}