public class HandleObjectWrapper<UnderlyingHandle>: WrapperStruct {
  public var underlyingHandle: UnderlyingHandle
  public private(set) var destroyed = false

  public init(underlyingHandle: UnderlyingHandle) {
    self.underlyingHandle = underlyingHandle
  }

  public final func destroy() {
    destroyUnderlying()
    destroyed = true
  }

  public func destroyUnderlying() {
    fatalError("destroyUnderlying() not implemented")
  }

  public var vulkan: UnderlyingHandle {
    underlyingHandle
  }

  deinit {
    if !destroyed {
      print("a wrapper class got deinitialized before the underlying vulkan object was explicitly destroyed: \(self)")
    }
  }
}