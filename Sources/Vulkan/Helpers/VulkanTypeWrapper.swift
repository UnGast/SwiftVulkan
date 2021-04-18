public protocol AnyVulkanTypeWrapper {
  var anyVulkan: Any { mutating get }
  var anyVulkanArray: [Any] { mutating get }
}

public protocol VulkanTypeWrapper: AnyVulkanTypeWrapper {
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

  public var anyVulkan: Any {
    mutating get {
      vulkan
    }
  }

  public var vulkanArray: [Wrapped] {
    mutating get {
      [vulkan]
    }
  }

  public var anyVulkanArray: [Any] {
    mutating get {
      vulkanArray
    }
  }
}