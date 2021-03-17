import CVulkan

public struct SpecializationMapEntry: VulkanTypeWrapper {
  /** The SpecConstant ID specified in the BIL */
public var constantID: UInt32
/** Offset of the value in the data block */
public var offset: UInt32
/** Size in bytes of the SpecConstant */
public var size: SizeT

  

  public init(
    constantID: UInt32,
offset: UInt32,
size: SizeT
  ) {
    self.constantID = constantID
self.offset = offset
self.size = size
  }

  public var vulkan: VkSpecializationMapEntry {
    mutating get {
      
      return VkSpecializationMapEntry(
        constantID: constantID.vulkan,
offset: offset.vulkan,
size: size.vulkan
      )
    }
  }
}