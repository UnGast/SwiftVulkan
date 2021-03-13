
import CVulkan

public class PipelineLayout: WrapperStruct {
    public var vulkanValue: VkPipelineLayout
    public var device: Device

    init(vulkanValue: VkPipelineLayout,
            device: Device) {
        self.vulkanValue = vulkanValue
        self.device = device
    }

    public class func create(device: Device, createInfo: PipelineLayoutCreateInfo) throws -> PipelineLayout {
        var pipelineLayout = VkPipelineLayout(bitPattern: 0)

        let opResult = withUnsafePointer(to: createInfo.vulkan) {
            return vkCreatePipelineLayout(device.pointer, $0, nil, &pipelineLayout)
        }

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return PipelineLayout(vulkanValue: pipelineLayout!, device: device)
    }

    public var vulkan: VkPipelineLayout? {
        vulkanValue
    }

    deinit {
        vkDestroyPipelineLayout(self.device.pointer, self.vulkanValue, nil)
    }
}