import CVulkan

public struct AccelerationStructureInstanceKHR: VulkanTypeWrapper {
  public var transform: TransformMatrixKHR
public var instanceCustomIndex: UInt32
public var mask: UInt32
public var instanceShaderBindingTableRecordOffset: UInt32
public var flags: GeometryInstanceFlagsKHR?
public var accelerationStructureReference: UInt64

  

  public init(
    transform: TransformMatrixKHR,
instanceCustomIndex: UInt32,
mask: UInt32,
instanceShaderBindingTableRecordOffset: UInt32,
flags: GeometryInstanceFlagsKHR? = nil,
accelerationStructureReference: UInt64
  ) {
    self.transform = transform
self.instanceCustomIndex = instanceCustomIndex
self.mask = mask
self.instanceShaderBindingTableRecordOffset = instanceShaderBindingTableRecordOffset
self.flags = flags
self.accelerationStructureReference = accelerationStructureReference
  }

  public var vulkan: VkAccelerationStructureInstanceKHR {
    mutating get {
      
      return VkAccelerationStructureInstanceKHR(
        transform: transform.vulkan,
instanceCustomIndex: instanceCustomIndex.vulkan,
mask: mask.vulkan,
instanceShaderBindingTableRecordOffset: instanceShaderBindingTableRecordOffset.vulkan,
flags: flags?.vulkan ?? 0,
accelerationStructureReference: accelerationStructureReference.vulkan
      )
    }
  }
}