import CVulkan

public struct DescriptorSetLayoutBinding: VulkanTypeWrapper {
  /** Binding number for this entry */
public var binding: UInt32
/** Type of the descriptors in this binding */
public var descriptorType: DescriptorType
/** Number of descriptors in this binding */
public var descriptorCount: UInt32?
/** Shader stages this binding is visible to */
public var stageFlags: ShaderStageFlags
public var immutableSamplers: [Sampler]?

  

  public init(
    binding: UInt32,
descriptorType: DescriptorType,
descriptorCount: UInt32? = nil,
stageFlags: ShaderStageFlags,
immutableSamplers: [Sampler]? = nil
  ) {
    self.binding = binding
self.descriptorType = descriptorType
self.descriptorCount = descriptorCount
self.stageFlags = stageFlags
self.immutableSamplers = immutableSamplers
  }

  public var vulkan: VkDescriptorSetLayoutBinding {
    mutating get {
      
      return VkDescriptorSetLayoutBinding(
        binding: binding.vulkan,
descriptorType: descriptorType.vulkan,
descriptorCount: descriptorCount?.vulkan ?? 0,
stageFlags: stageFlags.vulkan,
pImmutableSamplers: immutableSamplers?.vulkan
      )
    }
  }
}