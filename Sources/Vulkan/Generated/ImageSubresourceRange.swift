import CVulkan

public struct ImageSubresourceRange: VulkanTypeWrapper {
  public var aspectMask: ImageAspectFlags
public var baseMipLevel: UInt32
public var levelCount: UInt32
public var baseArrayLayer: UInt32
public var layerCount: UInt32

  

  public init(
    aspectMask: ImageAspectFlags,
baseMipLevel: UInt32,
levelCount: UInt32,
baseArrayLayer: UInt32,
layerCount: UInt32
  ) {
    self.aspectMask = aspectMask
self.baseMipLevel = baseMipLevel
self.levelCount = levelCount
self.baseArrayLayer = baseArrayLayer
self.layerCount = layerCount
  }

  public var vulkan: VkImageSubresourceRange {
    mutating get {
      
      return VkImageSubresourceRange(
        aspectMask: aspectMask.vulkan,
baseMipLevel: baseMipLevel.vulkan,
levelCount: levelCount.vulkan,
baseArrayLayer: baseArrayLayer.vulkan,
layerCount: layerCount.vulkan
      )
    }
  }
}