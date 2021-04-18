
import CVulkan

public class DescriptorSet: VulkanHandleTypeWrapper, VulkanTypeWrapper {
    public let pointer: VkDescriptorSet
    public let device: Device
    public let descriptorPool: DescriptorPool

    init(pointer: VkDescriptorSet,
        device: Device,
        descriptorPool: DescriptorPool) {
        self.pointer = pointer
        self.device = device
        self.descriptorPool = descriptorPool
    }

    public var vulkan: VkDescriptorSet? {
        pointer
    }

    public class func allocate(device: Device, allocateInfo: DescriptorSetAllocateInfo) -> [DescriptorSet] {
        var allocateInfo = allocateInfo
        var pointers: [VkDescriptorSet?] = Array(repeating: nil, count: Int(allocateInfo.descriptorSetCount))
        
        vkAllocateDescriptorSets(
            device.pointer,
            [allocateInfo.vulkan],
            &pointers)
        
        return pointers.map {
            DescriptorSet(pointer: $0!, device: device, descriptorPool: allocateInfo.descriptorPool)
        }
    }

    public class func update(
        device: Device,
        descriptorWrites: [WriteDescriptorSet]? = nil, 
        descriptorCopies: [CopyDescriptorSet]? = nil) {
            var descriptorWrites = descriptorWrites

            if descriptorCopies != nil {
                fatalError("IMPLEMENT descriptorCopies")
            }

            vkUpdateDescriptorSets(
                device.pointer,
                UInt32(descriptorWrites?.count ?? 0), descriptorWrites?.vulkanArray,
                0, nil)
    }

    public class func free(device: Device, descriptorPool: DescriptorPool, descriptorSets: [DescriptorSet]) {
        var descriptorSets = descriptorSets
        vkFreeDescriptorSets(device.pointer, descriptorPool.pointer, UInt32(descriptorSets.count), descriptorSets.vulkan)
    }

    public func free() {
        Self.free(device: device, descriptorPool: descriptorPool, descriptorSets: [self])
    }

    override public func destroyUnderlying() {
        free()
    }
}