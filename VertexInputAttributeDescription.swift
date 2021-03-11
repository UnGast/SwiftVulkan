import CVulkan

public struct VertexInputAttributeDescription: WrapperStruct {
  public var location: UInt32
  public var binding: UInt32
  public var format: Format
  public var offset: UInt32

  public init(
    location: UInt32,
    binding: UInt32,
    format: Format,
    offset: UInt32
  ) {
    self.location = location
    self.binding = binding
    self.format = format
    self.offset = offset
  }

  public var vulkan: VkVertexInputAttributeDescription {
    VkVertexInputAttributeDescription(
      location: location,
      binding: binding,
      format: format.vulkan,
      offset: offset
    )
  }
}