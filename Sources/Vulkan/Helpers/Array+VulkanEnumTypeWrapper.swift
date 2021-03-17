extension Array where Element: VulkanEnumTypeWrapper {
  public var vulkan: [Element.Wrapped] {
    get {
      var result = [Element.Wrapped]()
      for index in 0..<count {
        result.append(self[index].vulkan)
      }
      return result
    }
  }

  public var vulkanArray: [Element.Wrapped] {
    get {
      vulkan
    }
  }
}