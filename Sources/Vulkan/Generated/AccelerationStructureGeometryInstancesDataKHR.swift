import CVulkan

public struct AccelerationStructureGeometryInstancesDataKHR: VulkanTypeWrapper {
  public var next: Any?
public var arrayOfPointers: Bool
public var data: DeviceOrHostAddressConstKHR

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
arrayOfPointers: Bool,
data: DeviceOrHostAddressConstKHR
  ) {
    self.next = next
self.arrayOfPointers = arrayOfPointers
self.data = data
  }

  public var vulkan: VkAccelerationStructureGeometryInstancesDataKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureGeometryInstancesDataKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR,
pNext: vNext,
arrayOfPointers: arrayOfPointers.vulkan,
data: data.vulkan
      )
    }
  }
}