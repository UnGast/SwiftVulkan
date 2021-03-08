import CVulkan

public enum SubpassContents: UInt32 {
  case inline = 0,
    secondaryCommandBuffers = 1

  public var vulkan: VkSubpassContents {
    VkSubpassContents(self.rawValue)
  }
}