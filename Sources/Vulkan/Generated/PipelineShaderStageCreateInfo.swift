import CVulkan

public struct PipelineShaderStageCreateInfo: VulkanTypeWrapper {
  public var next: Any?
public var flags: PipelineShaderStageCreateFlags?
/** Shader stage */
public var stage: ShaderStageFlagBits
/** Module containing entry point */
public var module: ShaderModule
/** Null-terminated entry point name */
public var pName: String
public var specializationInfo: SpecializationInfo?

  var vNext: [Any]? = nil
var vSpecializationInfo: [VkSpecializationInfo]? = nil

  public init(
    next: Any? = nil,
flags: PipelineShaderStageCreateFlags? = nil,
stage: ShaderStageFlagBits,
module: ShaderModule,
pName: String,
specializationInfo: SpecializationInfo? = nil
  ) {
    self.next = next
self.flags = flags
self.stage = stage
self.module = module
self.pName = pName
self.specializationInfo = specializationInfo
  }

  public var vulkan: VkPipelineShaderStageCreateInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
vSpecializationInfo = specializationInfo?.vulkanArray
      return VkPipelineShaderStageCreateInfo(
        sType: VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
pNext: vNext,
flags: flags?.vulkan ?? 0,
stage: stage.vulkan,
module: module.vulkan,
pName: pName.vulkan,
pSpecializationInfo: vSpecializationInfo
      )
    }
  }
}