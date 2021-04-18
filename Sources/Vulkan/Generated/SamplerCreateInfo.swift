import CVulkan

public struct SamplerCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: SamplerCreateFlags?
/** Filter mode for magnification */
public var magFilter: Filter
/** Filter mode for minifiation */
public var minFilter: Filter
/** Mipmap selection mode */
public var mipmapMode: SamplerMipmapMode
public var addressModeU: SamplerAddressMode
public var addressModeV: SamplerAddressMode
public var addressModeW: SamplerAddressMode
public var mipLodBias: Float
public var anisotropyEnable: Bool
public var maxAnisotropy: Float
public var compareEnable: Bool
public var compareOp: CompareOp
public var minLod: Float
public var maxLod: Float
public var borderColor: BorderColor
public var unnormalizedCoordinates: Bool

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: SamplerCreateFlags? = nil,
magFilter: Filter,
minFilter: Filter,
mipmapMode: SamplerMipmapMode,
addressModeU: SamplerAddressMode,
addressModeV: SamplerAddressMode,
addressModeW: SamplerAddressMode,
mipLodBias: Float,
anisotropyEnable: Bool,
maxAnisotropy: Float,
compareEnable: Bool,
compareOp: CompareOp,
minLod: Float,
maxLod: Float,
borderColor: BorderColor,
unnormalizedCoordinates: Bool
  ) {
    self.next = next
self.flags = flags
self.magFilter = magFilter
self.minFilter = minFilter
self.mipmapMode = mipmapMode
self.addressModeU = addressModeU
self.addressModeV = addressModeV
self.addressModeW = addressModeW
self.mipLodBias = mipLodBias
self.anisotropyEnable = anisotropyEnable
self.maxAnisotropy = maxAnisotropy
self.compareEnable = compareEnable
self.compareOp = compareOp
self.minLod = minLod
self.maxLod = maxLod
self.borderColor = borderColor
self.unnormalizedCoordinates = unnormalizedCoordinates
  }

  public var vulkan: VkSamplerCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkSamplerCreateInfo(
        sType: VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
magFilter: magFilter.vulkan,
minFilter: minFilter.vulkan,
mipmapMode: mipmapMode.vulkan,
addressModeU: addressModeU.vulkan,
addressModeV: addressModeV.vulkan,
addressModeW: addressModeW.vulkan,
mipLodBias: mipLodBias.vulkan,
anisotropyEnable: anisotropyEnable.vulkan,
maxAnisotropy: maxAnisotropy.vulkan,
compareEnable: compareEnable.vulkan,
compareOp: compareOp.vulkan,
minLod: minLod.vulkan,
maxLod: maxLod.vulkan,
borderColor: borderColor.vulkan,
unnormalizedCoordinates: unnormalizedCoordinates.vulkan
      )
    }
  }
}