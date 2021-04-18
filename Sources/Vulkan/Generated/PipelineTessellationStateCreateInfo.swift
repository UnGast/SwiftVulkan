import CVulkan

public struct PipelineTessellationStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineTessellationStateCreateFlags?
public var patchControlPoints: UInt32

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: PipelineTessellationStateCreateFlags? = nil,
patchControlPoints: UInt32
  ) {
    self.next = next
self.flags = flags
self.patchControlPoints = patchControlPoints
  }

  public var vulkan: VkPipelineTessellationStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkPipelineTessellationStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
patchControlPoints: patchControlPoints.vulkan
      )
    }
  }
}