import CVulkan

public class DeviceMemory: VulkanHandleTypeWrapper {
    private let device: Device
    public let pointer: VkDeviceMemory

    init(_ pointer: VkDeviceMemory,
        device: Device) {
        self.pointer = pointer
        self.device = device
    }

    public class func allocateMemory(
        inDevice device: Device,
        allocInfo allocateInfo: MemoryAllocateInfo) throws -> DeviceMemory {

        var deviceMemory = VkDeviceMemory(bitPattern: 0)
        let opResult = withUnsafePointer(to: allocateInfo.vulkan) {
            return vkAllocateMemory(device.pointer, $0, nil, &deviceMemory)
        }
        
        return DeviceMemory(deviceMemory!, device: device)
    }

    public func free() {
        destroy()
    }

    public func mapMemory(offset: DeviceSize, size: DeviceSize, flags: MemoryMapFlags, data: inout UnsafeMutableRawPointer?) throws {
        
        //var rawPointer: UnsafeMutableRawPointer?  = nil

        let opResult = withUnsafeMutablePointer(to: &data) { ptr in
            return vkMapMemory(device.pointer, self.pointer, offset, size, flags.vulkan, ptr)
        }

        /*guard opResult == VK_SUCCESS || rawPointer == nil else {
            throw opResult.toResult()
        }*/

        /*if let rawPointer = rawPointer {
            let dataSize = MemoryLayout.size(ofValue: data)
        
            withUnsafePointer(to: data) {
                rawPointer.copyMemory(from: $0, byteCount: dataSize)
            }
        }*/
    }

    public func unmapMemory() {
        vkUnmapMemory(device.pointer, self.pointer)
    }

    public override func destroyUnderlying() {
        print("freeing memory: \(self)")
        vkFreeMemory(device.pointer, self.pointer, nil)
    }
}