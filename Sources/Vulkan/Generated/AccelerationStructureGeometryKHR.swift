import CVulkan

public struct AccelerationStructureGeometryKHR: VulkanTypeWrapper {
  public var geometryType: GeometryTypeKHR
public var geometry: AccelerationStructureGeometryDataKHR
public var flags: GeometryFlagsKHR?

  

  public init(
    geometryType: GeometryTypeKHR,
geometry: AccelerationStructureGeometryDataKHR,
flags: GeometryFlagsKHR? = nil
  ) {
    self.geometryType = geometryType
self.geometry = geometry
self.flags = flags
  }

  public var vulkan: VkAccelerationStructureGeometryKHR {
    mutating get {
      
      return VkAccelerationStructureGeometryKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR,
pNext: nil,
geometryType: geometryType.vulkan,
geometry: geometry.vulkan,
flags: flags?.vulkan ?? 0
      )
    }
  }
}