
import CVulkan

public class Image: VulkanHandleTypeWrapper {
    public let pointer: VkImage
    public let device: Device
    let swapchain: Swapchain?

    var boundMemory: DeviceMemory? = nil

    init(fromVulkan pointer: VkImage,
        device: Device,
        swapchain: Swapchain?) {
        self.pointer = pointer
        self.device = device
        self.swapchain = swapchain
    }

    public var vulkan: VkImage {
        pointer
    }

    public class func create(withInfo createInfo: ImageCreateInfo,
                            device: Device) throws -> Image {

        var image = VkImage(bitPattern: 0)
        let opResult = withUnsafePointer(to: createInfo.vulkan) {
            return vkCreateImage(device.pointer, $0, nil, &image)
        }

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }
        
        return Image(fromVulkan: image!, device: device, swapchain: nil)
    }

    public func bindMemory(memory: DeviceMemory) throws {
        let opResult = vkBindImageMemory(self.device.pointer, self.pointer, memory.pointer, 0)

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        self.boundMemory = memory
    }

    public lazy var memoryRequirements: MemoryRequirements = {
        var memReqs = [VkMemoryRequirements()]
        vkGetImageMemoryRequirements(self.device.pointer, self.pointer, &memReqs)

        return MemoryRequirements(memReqs[0])
    }()

    override public func destroyUnderlying() {
        // if this image belongs to a swapchain, it will be destroyed along with it
        vkDestroyImage(self.device.pointer, self.pointer, nil)
    }
}