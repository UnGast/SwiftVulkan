import CVulkan

public struct FramebufferCreateFlag: WrapperFlag {
  public let value: UInt32

  public init(integerLiteral value: UInt32) {
    self.value = value
  }

  public static let imageless = Self(integerLiteral: VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT.rawValue)
  public static let imagelessKhr = Self(integerLiteral: VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT_KHR.rawValue)
}

public typealias FramebufferCreateFlags = Set<FramebufferCreateFlag>