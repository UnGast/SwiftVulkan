import CVulkan

public struct PushConstantRange: VulkanTypeWrapper {
  /** Which stages use the range */
public var stageFlags: ShaderStageFlags
/** Start of the range, in bytes */
public var offset: UInt32
/** Size of the range, in bytes */
public var size: UInt32

  

  public init(
    stageFlags: ShaderStageFlags,
offset: UInt32,
size: UInt32
  ) {
    self.stageFlags = stageFlags
self.offset = offset
self.size = size
  }

  public var vulkan: VkPushConstantRange {
    mutating get {
      
      return VkPushConstantRange(
        stageFlags: stageFlags.vulkan,
offset: offset.vulkan,
size: size.vulkan
      )
    }
  }
}