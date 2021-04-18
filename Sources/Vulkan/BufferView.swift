
import CVulkan

public class BufferView: VulkanHandleTypeWrapper, VulkanTypeWrapper{
    let pointer: VkBufferView
    let device: Device

    init(pointer: VkBufferView, device: Device) {
        self.pointer = pointer
        self.device = device
    }

    override public func destroyUnderlying() {
        vkDestroyBufferView(device.pointer, pointer, nil)
    }

    public var vulkan: VkBufferView? {
        pointer
    }
}