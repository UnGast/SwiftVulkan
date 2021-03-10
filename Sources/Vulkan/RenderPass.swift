
import CVulkan

public class RenderPass: WrapperClass {
    public let pointer: VkRenderPass
    public let device: Device

    init(pointer: VkRenderPass, device: Device) {
        self.pointer = pointer 
        self.device = device
    }

    public class func create(createInfo: RenderPassCreateInfo, device: Device) throws -> RenderPass {
        var renderPass = VkRenderPass(bitPattern: 0)
        var vulkanCreateInfo = createInfo
        let opResult = withUnsafePointer(to: vulkanCreateInfo.toVulkan()) {
            return vkCreateRenderPass(device.pointer, $0, nil, &renderPass)
        }
        
        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return RenderPass(pointer: renderPass!, device: device)
    }

    override public func destroyUnderlying() {
        vkDestroyRenderPass(device.pointer, pointer, nil)
    }
}