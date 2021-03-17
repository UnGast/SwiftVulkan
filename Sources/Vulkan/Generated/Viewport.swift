import CVulkan

public struct Viewport: VulkanTypeWrapper {
  public var x: Float
public var y: Float
public var width: Float
public var height: Float
public var minDepth: Float
public var maxDepth: Float

  

  public init(
    x: Float,
y: Float,
width: Float,
height: Float,
minDepth: Float,
maxDepth: Float
  ) {
    self.x = x
self.y = y
self.width = width
self.height = height
self.minDepth = minDepth
self.maxDepth = maxDepth
  }

  public var vulkan: VkViewport {
    mutating get {
      
      return VkViewport(
        x: x.vulkan,
y: y.vulkan,
width: width.vulkan,
height: height.vulkan,
minDepth: minDepth.vulkan,
maxDepth: maxDepth.vulkan
      )
    }
  }
}