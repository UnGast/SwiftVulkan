import CVulkan

public struct PipelineInputAssemblyStateCreateInfo: WrapperStruct {
  public let topology: Topology
  public let primitiveRestartEnable: Bool

  public init(topology: Topology, primitiveRestartEnable: Bool) {
    self.topology = topology
    self.primitiveRestartEnable = primitiveRestartEnable
  }

  public var vulkan: VkPipelineInputAssemblyStateCreateInfo {
    var info = VkPipelineInputAssemblyStateCreateInfo()
    info.sType = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
    info.pNext = nil
    info.topology = topology.vulkan
    info.primitiveRestartEnable = primitiveRestartEnable.vulkan
    return info
  }

  public enum Topology {
    case triangleList
    
    public var vulkan: VkPrimitiveTopology {
      switch self {
      case .triangleList:
        return VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST
      }
    }
  }
}