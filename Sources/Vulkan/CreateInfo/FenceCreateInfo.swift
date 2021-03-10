import CVulkan

public struct FenceCreateInfo: WrapperStruct {
  public var flags: Set<Flag>

  public init(flags: Set<Flag>) {
    self.flags = flags
  }

  public var vulkan: VkFenceCreateInfo {
    VkFenceCreateInfo(
      sType: VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
      pNext: nil,
      flags: flags.vulkan
    )
  }

  public struct Flag: WrapperFlag {
    public let value: UInt32

    public init(integerLiteral value: UInt32) {
      self.value = value
    }

    public static let signaled: Flag = 0x00000001
  }
}