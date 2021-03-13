extension Array where Element: WrapperStruct {
  public var vulkan: [Element.Wrapped] {
    map { $0.vulkan }
  }

  public var vulkanArray: [Element.Wrapped] {
    map { $0.vulkan }
  }

  public var vulkanPointer: UnsafePointer<Element.Wrapped> {
    let result = UnsafeMutableBufferPointer<Element.Wrapped>.allocate(capacity: count)
    _ = result.initialize(from: self.vulkan)
    return UnsafePointer(result.baseAddress!)
  }
}