public protocol VulkanTypeWrapper {
  associatedtype Wrapped

  var vulkan: Wrapped { mutating get }
  var vulkanArray: [Wrapped] { mutating get }
}

extension VulkanTypeWrapper {
  public var vulkan: Wrapped {
    mutating get {
      fatalError("expVulkan not implemented")
    }
  }

  public var vulkanArray: [Wrapped] {
    mutating get {
      [vulkan]
    }
  }
}