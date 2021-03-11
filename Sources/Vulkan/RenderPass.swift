
import CVulkan

public class RenderPass: HandleObjectWrapper<VkRenderPass> {
    public let device: Device

    init(underlyingHandle: VkRenderPass, device: Device) {
        self.device = device
        super.init(underlyingHandle: underlyingHandle)
    }

    public class func create(createInfo: RenderPassCreateInfo, device: Device) throws -> RenderPass {
        var handle = VkRenderPass(bitPattern: 0)
        var vulkanCreateInfo = createInfo
        let opResult = withUnsafePointer(to: vulkanCreateInfo.toVulkan()) {
            return vkCreateRenderPass(device.pointer, $0, nil, &handle)
        }
        
        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return RenderPass(underlyingHandle: handle!, device: device)
    }

    override public func destroyUnderlying() {
        vkDestroyRenderPass(device.pointer, underlyingHandle, nil)
    }
}