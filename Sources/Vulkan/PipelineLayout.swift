
import CVulkan

public class PipelineLayout: VulkanHandleTypeWrapper, VulkanTypeWrwapper {
    public var pointer: VkPipelineLayout
    public var device: Device

    init(pointer: VkPipelineLayout,
            device: Device) {
        self.pointer = pointer 
        self.device = device
    }

    public class func create(device: Device, createInfo: PipelineLayoutCreateInfo) throws -> PipelineLayout {
        var createInfo = createInfo

        var pipelineLayout = VkPipelineLayout(bitPattern: 0)

        let opResult = withUnsafePointer(to: createInfo.vulkan) {
            return vkCreatePipelineLayout(device.pointer, $0, nil, &pipelineLayout)
        }

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return PipelineLayout(pointer: pipelineLayout!, device: device)
    }

    public var vulkan: VkPipelineLayout? {
       pointer 
    }

    override public func destroyUnderlying() {
        vkDestroyPipelineLayout(self.device.pointer, self.pointer, nil)
    }
}