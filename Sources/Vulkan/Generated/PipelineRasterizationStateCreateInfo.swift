import CVulkan

public struct PipelineRasterizationStateCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineRasterizationStateCreateFlags?
public var depthClampEnable: Bool
public var rasterizerDiscardEnable: Bool
/** optional (GL45) */
public var polygonMode: PolygonMode
public var cullMode: CullModeFlags?
public var frontFace: FrontFace
public var depthBiasEnable: Bool
public var depthBiasConstantFactor: Float
public var depthBiasClamp: Float
public var depthBiasSlopeFactor: Float
public var lineWidth: Float

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
flags: PipelineRasterizationStateCreateFlags? = nil,
depthClampEnable: Bool,
rasterizerDiscardEnable: Bool,
polygonMode: PolygonMode,
cullMode: CullModeFlags? = nil,
frontFace: FrontFace,
depthBiasEnable: Bool,
depthBiasConstantFactor: Float,
depthBiasClamp: Float,
depthBiasSlopeFactor: Float,
lineWidth: Float
  ) {
    self.next = next
self.flags = flags
self.depthClampEnable = depthClampEnable
self.rasterizerDiscardEnable = rasterizerDiscardEnable
self.polygonMode = polygonMode
self.cullMode = cullMode
self.frontFace = frontFace
self.depthBiasEnable = depthBiasEnable
self.depthBiasConstantFactor = depthBiasConstantFactor
self.depthBiasClamp = depthBiasClamp
self.depthBiasSlopeFactor = depthBiasSlopeFactor
self.lineWidth = lineWidth
  }

  public var vulkan: VkPipelineRasterizationStateCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkPipelineRasterizationStateCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
depthClampEnable: depthClampEnable.vulkan,
rasterizerDiscardEnable: rasterizerDiscardEnable.vulkan,
polygonMode: polygonMode.vulkan,
cullMode: cullMode?.vulkan ?? 0,
frontFace: frontFace.vulkan,
depthBiasEnable: depthBiasEnable.vulkan,
depthBiasConstantFactor: depthBiasConstantFactor.vulkan,
depthBiasClamp: depthBiasClamp.vulkan,
depthBiasSlopeFactor: depthBiasSlopeFactor.vulkan,
lineWidth: lineWidth.vulkan
      )
    }
  }
}