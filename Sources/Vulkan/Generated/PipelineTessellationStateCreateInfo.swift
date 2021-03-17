import CVulkan

public struct PipelineTessellationStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineTessellationStateCreateFlags?
public var patchControlPoints: UInt32

  

  public init(
    flags: PipelineTessellationStateCreateFlags? = nil,
patchControlPoints: UInt32
  ) {
    self.flags = flags
self.patchControlPoints = patchControlPoints
  }

  public var vulkan: VkPipelineTessellationStateCreateInfo {
    mutating get {
      
      return VkPipelineTessellationStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
patchControlPoints: patchControlPoints.vulkan
      )
    }
  }
}