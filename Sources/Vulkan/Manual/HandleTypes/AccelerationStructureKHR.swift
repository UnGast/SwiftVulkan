import CVulkan

public class AccelerationStructureKHR: VulkanHandleTypeWrapper {
    private let device: Device
    private let pointer: VkAccelerationStructureKHR

    public init(device: Device, pointer: VkAccelerationStructureKHR) {
        self.device = device
        self.pointer = pointer
    }

    public convenience init(device: Device, createInfo: AccelerationStructureCreateInfoKHR) throws {
        var createInfo = createInfo
        var pointer: VkAccelerationStructureKHR?

        let pvkCreateAccelerationStructureKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkCreateAccelerationStructureKHR"),
            to: PFN_vkCreateAccelerationStructureKHR.self)
        
        let result = withUnsafePointer(to: createInfo.vulkan) {
            pvkCreateAccelerationStructureKHR(device.pointer, $0, nil, &pointer)
        }.toSwift()

        if result != .success {
            throw result
        }

        self.init(device: device, pointer: pointer!)
    }

    public var vulkan: VkAccelerationStructureKHR {
        pointer
    }

    override public func destroyUnderlying() {
        let pvkDestroyAccelerationStructureKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkDestroyAccelerationStructureKHR"),
            to: PFN_vkDestroyAccelerationStructureKHR.self)
        pvkDestroyAccelerationStructureKHR(device.pointer, pointer, nil)
    }
}