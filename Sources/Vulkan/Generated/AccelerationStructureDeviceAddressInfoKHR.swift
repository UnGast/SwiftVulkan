import CVulkan

public struct AccelerationStructureDeviceAddressInfoKHR: VulkanTypeWrapper {
  public var accelerationStructure: AccelerationStructureKHR

  

  public init(
    accelerationStructure: AccelerationStructureKHR
  ) {
    self.accelerationStructure = accelerationStructure
  }

  public var vulkan: VkAccelerationStructureDeviceAddressInfoKHR {
    mutating get {
      
      return VkAccelerationStructureDeviceAddressInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR,
pNext: nil,
accelerationStructure: accelerationStructure.vulkan
      )
    }
  }
}