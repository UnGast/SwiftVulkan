import CVulkan

public struct Offset3D: VulkanTypeWrapper {
  public var x: Int32
public var y: Int32
public var z: Int32

  

  public init(
    x: Int32,
y: Int32,
z: Int32
  ) {
    self.x = x
self.y = y
self.z = z
  }

  public var vulkan: VkOffset3D {
    mutating get {
      
      return VkOffset3D(
        x: x.vulkan,
y: y.vulkan,
z: z.vulkan
      )
    }
  }
}