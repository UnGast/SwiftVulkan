import CVulkan

public struct AccelerationStructureGeometryAabbsDataKHR: VulkanTypeWrapper {
  public var data: DeviceOrHostAddressConstKHR
public var stride: DeviceSize

  

  public init(
    data: DeviceOrHostAddressConstKHR,
stride: DeviceSize
  ) {
    self.data = data
self.stride = stride
  }

  public var vulkan: VkAccelerationStructureGeometryAabbsDataKHR {
    mutating get {
      
      return VkAccelerationStructureGeometryAabbsDataKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR,
pNext: nil,
data: data.vulkan,
stride: stride.vulkan
      )
    }
  }
}