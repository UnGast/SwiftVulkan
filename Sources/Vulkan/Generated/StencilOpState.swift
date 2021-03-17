import CVulkan

public struct StencilOpState: VulkanTypeWrapper {
  public var failOp: StencilOp
public var passOp: StencilOp
public var depthFailOp: StencilOp
public var compareOp: CompareOp
public var compareMask: UInt32
public var writeMask: UInt32
public var reference: UInt32

  

  public init(
    failOp: StencilOp,
passOp: StencilOp,
depthFailOp: StencilOp,
compareOp: CompareOp,
compareMask: UInt32,
writeMask: UInt32,
reference: UInt32
  ) {
    self.failOp = failOp
self.passOp = passOp
self.depthFailOp = depthFailOp
self.compareOp = compareOp
self.compareMask = compareMask
self.writeMask = writeMask
self.reference = reference
  }

  public var vulkan: VkStencilOpState {
    mutating get {
      
      return VkStencilOpState(
        failOp: failOp.vulkan,
passOp: passOp.vulkan,
depthFailOp: depthFailOp.vulkan,
compareOp: compareOp.vulkan,
compareMask: compareMask.vulkan,
writeMask: writeMask.vulkan,
reference: reference.vulkan
      )
    }
  }
}