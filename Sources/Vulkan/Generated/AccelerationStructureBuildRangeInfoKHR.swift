import CVulkan

public struct AccelerationStructureBuildRangeInfoKHR: VulkanTypeWrapper {
  public var primitiveCount: UInt32
public var primitiveOffset: UInt32
public var firstVertex: UInt32
public var transformOffset: UInt32

  

  public init(
    primitiveCount: UInt32,
primitiveOffset: UInt32,
firstVertex: UInt32,
transformOffset: UInt32
  ) {
    self.primitiveCount = primitiveCount
self.primitiveOffset = primitiveOffset
self.firstVertex = firstVertex
self.transformOffset = transformOffset
  }

  public var vulkan: VkAccelerationStructureBuildRangeInfoKHR {
    mutating get {
      
      return VkAccelerationStructureBuildRangeInfoKHR(
        primitiveCount: primitiveCount.vulkan,
primitiveOffset: primitiveOffset.vulkan,
firstVertex: firstVertex.vulkan,
transformOffset: transformOffset.vulkan
      )
    }
  }
}