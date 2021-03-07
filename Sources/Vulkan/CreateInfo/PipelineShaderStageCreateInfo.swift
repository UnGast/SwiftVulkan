import CVulkan

public struct PipelineShaderStageCreateInfo: WrapperStruct {
    public let flags: Flags
    public let stage: ShaderStageFlags
    public let module: ShaderModule
    public let name: String
    public let specializationInfo: SpecializationInfo?

    public init(flags: Flags,
                stage: ShaderStageFlags,
                module: ShaderModule,
                name: String,
                specializationInfo: SpecializationInfo?) {
        self.flags = flags
        self.stage = stage
        self.module = module
        self.name = name
        self.specializationInfo = specializationInfo
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
    }

    public var vulkan: VkPipelineShaderStageCreateInfo {
        return VkPipelineShaderStageCreateInfo(
            sType: VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
            pNext: nil,
            flags: flags.rawValue,
            stage: VkShaderStageFlagBits(stage.rawValue),
            module: module.pointer,
            pName: name,
            pSpecializationInfo: nil)
    }
}