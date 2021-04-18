import CVulkan

public struct AccelerationStructureGeometryTrianglesDataKHR: VulkanTypeWrapper {
  public var next: Any?
public var vertexFormat: Format
public var vertexData: DeviceOrHostAddressConstKHR
public var vertexStride: DeviceSize
public var maxVertex: UInt32
public var indexType: IndexType
public var indexData: DeviceOrHostAddressConstKHR
public var transformData: DeviceOrHostAddressConstKHR

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
vertexFormat: Format,
vertexData: DeviceOrHostAddressConstKHR,
vertexStride: DeviceSize,
maxVertex: UInt32,
indexType: IndexType,
indexData: DeviceOrHostAddressConstKHR,
transformData: DeviceOrHostAddressConstKHR
  ) {
    self.next = next
self.vertexFormat = vertexFormat
self.vertexData = vertexData
self.vertexStride = vertexStride
self.maxVertex = maxVertex
self.indexType = indexType
self.indexData = indexData
self.transformData = transformData
  }

  public var vulkan: VkAccelerationStructureGeometryTrianglesDataKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureGeometryTrianglesDataKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR,
pNext: vNext,
vertexFormat: vertexFormat.vulkan,
vertexData: vertexData.vulkan,
vertexStride: vertexStride.vulkan,
maxVertex: maxVertex.vulkan,
indexType: indexType.vulkan,
indexData: indexData.vulkan,
transformData: transformData.vulkan
      )
    }
  }
}