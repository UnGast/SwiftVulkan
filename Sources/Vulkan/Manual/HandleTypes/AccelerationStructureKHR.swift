import CVulkan

public class AccelerationStructureKHR: VulkanHandleTypeWrapper, VulkanTypeWrapper{
    private let device: Device
    public let pointer: VkAccelerationStructureKHR

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

    public static func getBuildSizes(device: Device, buildType: AccelerationStructureBuildTypeKHR, buildInfo: AccelerationStructureBuildGeometryInfoKHR, maxPrimitiveCounts: [UInt32]) -> AccelerationStructureBuildSizesInfoKHR {
        var buildInfo = buildInfo

        let pvkGetAccelerationStructureBuildSizesKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkGetAccelerationStructureBuildSizesKHR"),
            to: PFN_vkGetAccelerationStructureBuildSizesKHR.self)

        var sizeInfo = VkAccelerationStructureBuildSizesInfoKHR(
            sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR,
            pNext: nil,
            accelerationStructureSize: 0,
            updateScratchSize: 0,
            buildScratchSize: 0
        )

        pvkGetAccelerationStructureBuildSizesKHR(
            device.pointer,
            buildType.vulkan,
            [buildInfo.vulkan],
            maxPrimitiveCounts,
            &sizeInfo)

        return AccelerationStructureBuildSizesInfoKHR(
            accelerationStructureSize: sizeInfo.accelerationStructureSize,
            updateScratchSize: sizeInfo.updateScratchSize,
            buildScratchSize: sizeInfo.buildScratchSize
        )
    }

    public func getDeviceAddressKHR() -> DeviceAddress {
        let pvkGetAccelerationStructureDeviceAddressKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkGetAccelerationStructureDeviceAddressKHR"),
            to: PFN_vkGetAccelerationStructureDeviceAddressKHR.self)

        var accelerationStructureDeviceAddressInfo = AccelerationStructureDeviceAddressInfoKHR(
            accelerationStructure: self)

        return pvkGetAccelerationStructureDeviceAddressKHR(device.pointer, [accelerationStructureDeviceAddressInfo.vulkan])
    }

    override public func destroyUnderlying() {
        let pvkDestroyAccelerationStructureKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkDestroyAccelerationStructureKHR"),
            to: PFN_vkDestroyAccelerationStructureKHR.self)
        pvkDestroyAccelerationStructureKHR(device.pointer, pointer, nil)
    }
}