
import CVulkan

public class DescriptorSetLayout: VulkanHandleTypeWrapper, VulkanTypeWrapper{
    public let pointer: VkDescriptorSetLayout
    public let device: Device

    init(pointer: VkDescriptorSetLayout,
        device: Device) {
        self.pointer = pointer
        self.device = device
    }

    public class func create(
        device: Device, 
        createInfo: DescriptorSetLayoutCreateInfo) throws -> DescriptorSetLayout {
            var createInfo = createInfo

            var layout = VkDescriptorSetLayout(bitPattern: 0)
            let opResult: VkResult = withUnsafePointer(to: createInfo.vulkan) {
                return vkCreateDescriptorSetLayout(device.pointer, $0, nil, &layout)
            }

            guard opResult == VK_SUCCESS else {
                throw opResult.toResult()
            }

            return DescriptorSetLayout(pointer: layout!, device: device)
    }

    public var vulkan: Optional<VkDescriptorSetLayout> {
        pointer
    }

    override public func destroyUnderlying() {
        vkDestroyDescriptorSetLayout(device.pointer, self.pointer, nil)
    }
}