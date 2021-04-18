import CVulkan

public struct WriteDescriptorSetAccelerationStructureKHR: VulkanTypeWrapper {
  public var next: Any?
public var accelerationStructures: [AccelerationStructureKHR]

  var vNext: [Any]? = nil
var vAccelerationStructures: [VkAccelerationStructureKHR?]? = nil

  public init(
    next: Any? = nil,
accelerationStructures: [AccelerationStructureKHR]
  ) {
    self.next = next
self.accelerationStructures = accelerationStructures
  }

  public var vulkan: VkWriteDescriptorSetAccelerationStructureKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
vAccelerationStructures = accelerationStructures.vulkanArray
      return VkWriteDescriptorSetAccelerationStructureKHR(
        sType: VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR,
pNext: vNext,
accelerationStructureCount: UInt32(accelerationStructures.count),
pAccelerationStructures: vAccelerationStructures
      )
    }
  }
}