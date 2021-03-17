
import CVulkan

public class DescriptorSetLayout: VulkanHandleTypeWrapper, WrapperStruct {
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

        var layout = VkDescriptorSetLayout(bitPattern: 0)
        /*let bindings = createInfo.bindings.map { return VkDescriptorSetLayoutBinding(
                binding: $0.binding,
                descriptorType: $0.descriptorType.vulkan,
                descriptorCount: $0.descriptorCount,
                stageFlags: UInt32($0.stageFlags.rawValue),
                pImmutableSamplers: $0.immutableSamplers?.vulkanPointer
        ) }

        let ci = VkDescriptorSetLayoutCreateInfo(
                sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
                pNext: nil,
                flags: createInfo.flags.rawValue,
                bindingCount: UInt32(createInfo.bindings.count),
                pBindings: bindings.vulkanPointer
        )*/

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