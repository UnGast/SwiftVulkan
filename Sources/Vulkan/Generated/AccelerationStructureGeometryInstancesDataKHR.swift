import CVulkan

public struct AccelerationStructureGeometryInstancesDataKHR: VulkanTypeWrapper {
  public var arrayOfPointers: Bool
public var data: DeviceOrHostAddressConstKHR

  

  public init(
    arrayOfPointers: Bool,
data: DeviceOrHostAddressConstKHR
  ) {
    self.arrayOfPointers = arrayOfPointers
self.data = data
  }

  public var vulkan: VkAccelerationStructureGeometryInstancesDataKHR {
    mutating get {
      
      return VkAccelerationStructureGeometryInstancesDataKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR,
pNext: nil,
arrayOfPointers: arrayOfPointers.vulkan,
data: data.vulkan
      )
    }
  }
}