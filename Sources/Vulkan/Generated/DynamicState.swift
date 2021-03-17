import CVulkan

public enum DynamicState: UInt32, VulkanEnumTypeWrapper {
  case viewport = 0,
scissor = 1,
lineWidth = 2,
depthBias = 3,
blendConstants = 4,
depthBounds = 5,
stencilCompareMask = 6,
stencilWriteMask = 7,
stencilReference = 8

  public init(fromVulkan: VkDynamicState) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkDynamicState {
    VkDynamicState(rawValue)
  }
}