public class VulkanHandleTypeWrapper {
  public private(set) var destroyed = false

  public final func destroy() {
    destroyUnderlying()
    destroyed = true
  }

  public func destroyUnderlying() {
    fatalError("destroyUnderlying() not implemented")
  }

  deinit {
    if !destroyed {
      print("a wrapper class got deinitialized before the underlying vulkan object was explicitly destroyed: \(self)")
    }
  }
}