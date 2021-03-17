extension Array where Element: VulkanHandleTypeWrapper, Element: WrapperStruct {
  public var vulkan: [Element.Wrapped] {
    var result = [Element.Wrapped]()
    for item in self {
      result.append(item.vulkan)
    }
    return result
  }

  public var vulkanArray: [Element.Wrapped] {
    vulkan
  }
}