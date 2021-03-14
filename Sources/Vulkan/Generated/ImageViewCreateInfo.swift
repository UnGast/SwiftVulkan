import CVulkan

public struct ImageViewCreateInfo: VulkanTypeWrapper {
  public var flags: ImageViewCreateFlags?
public var image: Image
public var viewType: ImageViewType
public var format: Format
public var components: ComponentMapping
public var subresourceRange: ImageSubresourceRange

  

  public init(
    flags: ImageViewCreateFlags? = nil,
image: Image,
viewType: ImageViewType,
format: Format,
components: ComponentMapping,
subresourceRange: ImageSubresourceRange
  ) {
    self.flags = flags
self.image = image
self.viewType = viewType
self.format = format
self.components = components
self.subresourceRange = subresourceRange
  }

  public var vulkan: VkImageViewCreateInfo {
    mutating get {
      
      return VkImageViewCreateInfo(
        sType: VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
image: image.vulkan,
viewType: viewType.vulkan,
format: format.vulkan,
components: components.vulkan,
subresourceRange: subresourceRange.vulkan
      )
    }
  }
}