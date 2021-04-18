import CVulkan

public struct AccelerationStructureDeviceAddressInfoKHR: VulkanTypeWrapper {
  public var next: Any?
public var accelerationStructure: AccelerationStructureKHR

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
accelerationStructure: AccelerationStructureKHR
  ) {
    self.next = next
self.accelerationStructure = accelerationStructure
  }

  public var vulkan: VkAccelerationStructureDeviceAddressInfoKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureDeviceAddressInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR,
pNext: vNext,
accelerationStructure: accelerationStructure.vulkan
      )
    }
  }
}