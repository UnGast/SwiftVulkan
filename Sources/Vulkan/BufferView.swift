
import CVulkan

public class BufferView: WrapperStruct {
    let pointer: VkBufferView

    init(pointer: VkBufferView) {
        self.pointer = pointer
    }

    public var vulkan: VkBufferView? {
        pointer
    }
}