import CVulkan

public enum CullMode {
  case none
  case front
  case back
  case frontAndBack

  public var vulkan: VkCullModeFlags {
    let bit: VkCullModeFlagBits
    switch self {
    case .none:
      bit = VK_CULL_MODE_NONE
    case .front:
      bit = VK_CULL_MODE_FRONT_BIT
    case .back:
      bit = VK_CULL_MODE_BACK_BIT
    case .frontAndBack:
      bit = VK_CULL_MODE_FRONT_AND_BACK
    }

    return VkCullModeFlags(bit.rawValue)
  }
}