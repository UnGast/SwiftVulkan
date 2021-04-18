import CVulkan

public struct PipelineInputAssemblyStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineInputAssemblyStateCreateFlags?
public var topology: PrimitiveTopology
public var primitiveRestartEnable: Bool

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: PipelineInputAssemblyStateCreateFlags? = nil,
topology: PrimitiveTopology,
primitiveRestartEnable: Bool
  ) {
    self.next = next
self.flags = flags
self.topology = topology
self.primitiveRestartEnable = primitiveRestartEnable
  }

  public var vulkan: VkPipelineInputAssemblyStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkPipelineInputAssemblyStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
topology: topology.vulkan,
primitiveRestartEnable: primitiveRestartEnable.vulkan
      )
    }
  }
}