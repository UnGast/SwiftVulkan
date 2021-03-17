import CVulkan

public struct PipelineInputAssemblyStateCreateInfo: VulkanTypeWrapper {
  public var flags: PipelineInputAssemblyStateCreateFlags?
public var topology: PrimitiveTopology
public var primitiveRestartEnable: Bool

  

  public init(
    flags: PipelineInputAssemblyStateCreateFlags? = nil,
topology: PrimitiveTopology,
primitiveRestartEnable: Bool
  ) {
    self.flags = flags
self.topology = topology
self.primitiveRestartEnable = primitiveRestartEnable
  }

  public var vulkan: VkPipelineInputAssemblyStateCreateInfo {
    mutating get {
      
      return VkPipelineInputAssemblyStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
pNext: nil,
flags: flags?.vulkan ?? 0,
topology: topology.vulkan,
primitiveRestartEnable: primitiveRestartEnable.vulkan
      )
    }
  }
}