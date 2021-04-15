import CVulkan

public enum AccelerationStructureGeometryDataKHR: VulkanTypeWrapper {
  case triangles(AccelerationStructureGeometryTrianglesDataKHR)
  case aabbs(AccelerationStructureGeometryAabbsDataKHR)
  case instances(AccelerationStructureGeometryInstancesDataKHR)

  

  public var vulkan: VkAccelerationStructureGeometryDataKHR {
    mutating get {
      switch self {   
        case var .triangles(value):
          return VkAccelerationStructureGeometryDataKHR(triangles: value.vulkan)
        case var .aabbs(value):
          return VkAccelerationStructureGeometryDataKHR(aabbs: value.vulkan)
        case var .instances(value):
          return VkAccelerationStructureGeometryDataKHR(instances: value.vulkan)
      }
    }
  }
}