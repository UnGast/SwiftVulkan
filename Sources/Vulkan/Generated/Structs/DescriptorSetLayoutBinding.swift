import CVulkan

public struct DescriptorSetLayoutBinding: WrapperStruct {
  /** Binding number for this entry */
public var binding: UInt32
/** Type of the descriptors in this binding */
public var descriptorType: DescriptorType
public var descriptorCount: UInt32
/** Shader stages this binding is visible to */
public var stageFlags: ShaderStageFlags
public var immutableSamplers: [Sampler]?

  public init(
    binding: UInt32,
descriptorType: DescriptorType,
descriptorCount: UInt32,
stageFlags: ShaderStageFlags,
immutableSamplers: [Sampler]?
  ) {
    self.binding = binding
self.descriptorType = descriptorType
self.descriptorCount = descriptorCount
self.stageFlags = stageFlags
self.immutableSamplers = immutableSamplers
  }

  public var vulkan: VkDescriptorSetLayoutBinding {
    VkDescriptorSetLayoutBinding(
      binding: binding.vulkan,
descriptorType: descriptorType.vulkan,
descriptorCount: descriptorCount,
stageFlags: stageFlags.vulkan,
pImmutableSamplers: immutableSamplers?.vulkanPointer
    )
  }
}