
import CVulkan

public class Sampler: WrapperStruct {
    public let pointer: VkSampler

    init(pointer: VkSampler) {
        self.pointer = pointer
    }

    public var vulkan: Optional<VkSampler> {
        Optional(pointer)
    }
}