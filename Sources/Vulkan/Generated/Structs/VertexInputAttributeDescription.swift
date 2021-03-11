import CVulkan

public struct VertexInputAttributeDescription: WrapperStruct {
  /** location of the shader vertex attrib */
public var location: UInt32
/** Vertex buffer binding id */
public var binding: UInt32
/** format of source data */
public var format: Format
/** Offset of first element in bytes from base of vertex */
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
      location: location.vulkan,
binding: binding.vulkan,
format: format.vulkan,
offset: offset.vulkan
    )
  }
}