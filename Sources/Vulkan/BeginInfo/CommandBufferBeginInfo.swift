import CVulkan

public struct CommandBufferBeginInfo: WrapperStruct {
  public var flags: [Flag]
  public var inheritanceInfo: Void?

  public init(flags: [Flag], inheritanceInfo: Void?) {
    self.flags = flags
    self.inheritanceInfo = inheritanceInfo
  }

  public var vulkan: VkCommandBufferBeginInfo {
    VkCommandBufferBeginInfo(
      sType: VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
      pNext: nil,
      flags: flags.reduce(into: 0) { $0 & $1.rawValue },
      pInheritanceInfo: nil
    )
  }

  public enum Flag: UInt32 {
    case oneTimeSubmit = 0x00000001,
      renderPassContinue = 0x00000002,
      simultaneousUse = 0x00000004 
  }
}