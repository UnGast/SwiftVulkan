import CVulkan

public struct DescriptorImageInfo: WrapperStruct {
  /** Sampler to write to the descriptor in case it is a SAMPLER or COMBINED_IMAGE_SAMPLER descriptor. Ignored otherwise. */
public var sampler: Sampler
/** Image view to write to the descriptor in case it is a SAMPLED_IMAGE, STORAGE_IMAGE, COMBINED_IMAGE_SAMPLER, or INPUT_ATTACHMENT descriptor. Ignored otherwise. */
public var imageView: ImageView
/** Layout the image is expected to be in when accessed using this descriptor (only used if imageView is not VK_NULL_HANDLE). */
public var imageLayout: ImageLayout

  public init(
    sampler: Sampler,
imageView: ImageView,
imageLayout: ImageLayout
  ) {
    self.sampler = sampler
self.imageView = imageView
self.imageLayout = imageLayout
  }

  public var vulkan: VkDescriptorImageInfo {
    VkDescriptorImageInfo(
      sampler: sampler.vulkan,
imageView: imageView.vulkan,
imageLayout: imageLayout.vulkan
    )
  }
}