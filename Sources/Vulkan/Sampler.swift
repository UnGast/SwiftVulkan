
import CVulkan

public class Sampler: VulkanHandleTypeWrapper, VulkanTypeWrapper{
    public let pointer: VkSampler
    public let device: Device

    init(pointer: VkSampler, device: Device) {
        self.pointer = pointer
        self.device = device
    }

    public convenience init(device: Device, createInfo: SamplerCreateInfo) throws {
        var createInfo = createInfo
        var pointer = VkInstance(bitPattern: 0)

        var opResult = VK_ERROR_INITIALIZATION_FAILED
        withUnsafePointer(to: createInfo.vulkan) {
            opResult = vkCreateSampler(device.pointer, $0, nil, &pointer)
        }

        if opResult == VK_SUCCESS {
            self.init(pointer: pointer!, device: device)
            return
        }

        throw opResult.toResult()
    }

    override public func destroyUnderlying() {
        vkDestroySampler(device.pointer, pointer, nil)
    }

    public var vulkan: Optional<VkSampler> {
        pointer
    }
}