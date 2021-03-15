import CVulkan

public struct ImageSubresourceLayers: VulkanTypeWrapper {
  public var aspectMask: ImageAspectFlags
public var mipLevel: UInt32
public var baseArrayLayer: UInt32
public var layerCount: UInt32

  

  public init(
    aspectMask: ImageAspectFlags,
mipLevel: UInt32,
baseArrayLayer: UInt32,
layerCount: UInt32
  ) {
    self.aspectMask = aspectMask
self.mipLevel = mipLevel
self.baseArrayLayer = baseArrayLayer
self.layerCount = layerCount
  }

  public var vulkan: VkImageSubresourceLayers {
    mutating get {
      
      return VkImageSubresourceLayers(
        aspectMask: aspectMask.vulkan,
mipLevel: mipLevel.vulkan,
baseArrayLayer: baseArrayLayer.vulkan,
layerCount: layerCount
      )
    }
  }
}