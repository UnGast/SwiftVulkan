import CVulkan

public enum ColorComponentFlag {
  case r, g, b, a
}

extension Set where Element == ColorComponentFlag {
  public var vulkan: VkColorComponentFlags {
    var flags: VkColorComponentFlags = 0
    if contains(.r) {
      flags = flags & VK_COLOR_COMPONENT_R_BIT.rawValue
    }
    if contains(.g) {
      flags = flags & VK_COLOR_COMPONENT_G_BIT.rawValue
    }
    if contains(.b) {
      flags = flags & VK_COLOR_COMPONENT_B_BIT.rawValue
    }
    if contains(.a) {
      flags = flags & VK_COLOR_COMPONENT_A_BIT.rawValue
    }
    return flags
  }
}