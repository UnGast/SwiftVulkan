import CVulkan

public struct AccelerationStructureGeometryAabbsDataKHR: VulkanTypeWrapper {
  public var next: Any?
public var data: DeviceOrHostAddressConstKHR
public var stride: DeviceSize

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
data: DeviceOrHostAddressConstKHR,
stride: DeviceSize
  ) {
    self.next = next
self.data = data
self.stride = stride
  }

  public var vulkan: VkAccelerationStructureGeometryAabbsDataKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureGeometryAabbsDataKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR,
pNext: vNext,
data: data.vulkan,
stride: stride.vulkan
      )
    }
  }
}