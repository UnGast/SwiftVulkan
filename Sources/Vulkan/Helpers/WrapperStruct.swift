public protocol WrapperStruct {
  associatedtype Wrapped

  var vulkan: Wrapped { get }
}

extension WrapperStruct {
  public var vulkanPointer: UnsafePointer<Wrapped> {
    let result = UnsafeMutablePointer<Wrapped>.allocate(capacity: 1)
    result.initialize(to: vulkan)
    return UnsafePointer(result)
  }
}