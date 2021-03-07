import CVulkan

public struct Extent2D: WrapperStruct {
  public var width: UInt32
  public var height: UInt32

  public init() {
    self.width = 0
    self.height = 0
  }

  public init(width: UInt32, height: UInt32) {
    self.width = width
    self.height = height
  }

  init(fromVulkan extent: VkExtent2D) {
    self.width = extent.width
    self.height = extent.height
  }

  public var vulkan: VkExtent2D {
    return VkExtent2D(width: self.width, height: self.height)
  }

  public func to3D(withDepth depth: UInt32) -> Extent3D {
    return Extent3D(width: self.width, height: self.height, depth: depth)
  }
}
