public struct PipelineShaderStageCreateInfo {
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
}