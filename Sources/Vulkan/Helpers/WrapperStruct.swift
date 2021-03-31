@available(deprecated, message: "use VulkanTypeWrapper")
public protocol WrapperStruct {
  associatedtype Wrapped

  var vulkan: Wrapped { get }
  var expVulkan: Wrapped { mutating get }

  func withVulkan(_ block: (Wrapped) -> ())
}

extension WrapperStruct {
  public var vulkanPointer: UnsafePointer<Wrapped> {
    let result = UnsafeMutablePointer<Wrapped>.allocate(capacity: 1)
    result.initialize(to: vulkan)
    return UnsafePointer(result)
  }

  public var expVulkan: Wrapped {
    mutating get {
      fatalError("expVulkan not implemented")
    }
  }

  public var vulkanArray: [Wrapped] {
    mutating get {
      [expVulkan]
    }
  }

  public func withVulkan(_ block: (Wrapped) -> ()) {
    fatalError("withVulkan() not implemented for: \(self)")
  }
}