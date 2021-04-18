import CVulkan

public struct CommandBufferBeginInfo: VulkanTypeWrapper {
  public var flags: Flags
  public var inheritanceInfo: Void?

  public init(flags: Flags, inheritanceInfo: Void?) {
    self.flags = flags
    self.inheritanceInfo = inheritanceInfo
  }

  public var vulkan: VkCommandBufferBeginInfo {
    mutating get {
      VkCommandBufferBeginInfo(
        sType: VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        pNext: nil,
        flags: flags.rawValue,
        pInheritanceInfo: nil
      )
    }
  }

  public struct Flags: OptionSet {
    public var rawValue: UInt32

    public init(rawValue: UInt32) {
      self.rawValue = rawValue
    }

    public static let oneTimeSubmit = Flags(rawValue: 0x00000001)
    public static let renderPassContinue = Flags(rawValue: 0x00000002)
    public static let simultaneousUse = Flags(rawValue: 0x00000004)
  }
}