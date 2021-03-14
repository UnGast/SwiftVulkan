import CVulkan

public struct ComponentMapping: VulkanTypeWrapper {
  public var r: ComponentSwizzle
public var g: ComponentSwizzle
public var b: ComponentSwizzle
public var a: ComponentSwizzle

  

  public init(
    r: ComponentSwizzle,
g: ComponentSwizzle,
b: ComponentSwizzle,
a: ComponentSwizzle
  ) {
    self.r = r
self.g = g
self.b = b
self.a = a
  }

  public var vulkan: VkComponentMapping {
    mutating get {
      
      return VkComponentMapping(
        r: r.vulkan,
g: g.vulkan,
b: b.vulkan,
a: a.vulkan
      )
    }
  }
}