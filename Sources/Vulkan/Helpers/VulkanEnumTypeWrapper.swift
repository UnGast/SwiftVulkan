public protocol VulkanEnumTypeWrapper {
  associatedtype Wrapped

  var vulkan: Wrapped { get }
  var vulkanArray: [Wrapped] { get }
}

extension VulkanEnumTypeWrapper {
  public var vulkan: Wrapped {
    get {
      fatalError("expVulkan not implemented")
    }
  }

  public var vulkanArray: [Wrapped] {
    get {
      [vulkan]
    }
  }
}