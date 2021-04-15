import CVulkan

public struct AccelerationStructureCreateInfoKHR: VulkanTypeWrapper {
  public var createFlags: AccelerationStructureCreateFlagsKHR?
public var buffer: Buffer
/** Specified in bytes */
public var offset: DeviceSize
public var size: DeviceSize
public var type: AccelerationStructureTypeKHR
public var deviceAddress: DeviceAddress?

  

  public init(
    createFlags: AccelerationStructureCreateFlagsKHR? = nil,
buffer: Buffer,
offset: DeviceSize,
size: DeviceSize,
type: AccelerationStructureTypeKHR,
deviceAddress: DeviceAddress? = nil
  ) {
    self.createFlags = createFlags
self.buffer = buffer
self.offset = offset
self.size = size
self.type = type
self.deviceAddress = deviceAddress
  }

  public var vulkan: VkAccelerationStructureCreateInfoKHR {
    mutating get {
      
      return VkAccelerationStructureCreateInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR,
pNext: nil,
createFlags: createFlags?.vulkan ?? 0,
buffer: buffer.vulkan,
offset: offset.vulkan,
size: size.vulkan,
type: type.vulkan,
deviceAddress: deviceAddress?.vulkan ?? 0
      )
    }
  }
}