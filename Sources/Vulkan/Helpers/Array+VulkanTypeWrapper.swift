extension Array where Element: VulkanTypeWrapper {
  public var vulkan: [Element.Wrapped] {
    mutating get {
      var result = [Element.Wrapped]()
      for index in 0..<count {
        result.append(self[index].vulkan)
      }
      return result
    }
  }

  public var vulkanArray: [Element.Wrapped] {
    mutating get {
      vulkan
    }
  }
}