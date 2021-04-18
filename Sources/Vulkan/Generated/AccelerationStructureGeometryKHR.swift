import CVulkan

public struct AccelerationStructureGeometryKHR: VulkanTypeWrapper {
  public var next: Any?
public var geometryType: GeometryTypeKHR
public var geometry: AccelerationStructureGeometryDataKHR
public var flags: GeometryFlagsKHR?

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
geometryType: GeometryTypeKHR,
geometry: AccelerationStructureGeometryDataKHR,
flags: GeometryFlagsKHR? = nil
  ) {
    self.next = next
self.geometryType = geometryType
self.geometry = geometry
self.flags = flags
  }

  public var vulkan: VkAccelerationStructureGeometryKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureGeometryKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR,
pNext: vNext,
geometryType: geometryType.vulkan,
geometry: geometry.vulkan,
flags: flags?.vulkan ?? 0
      )
    }
  }
}