
import CVulkan

public class DescriptorSet: WrapperStruct {

    public let pointer: VkDescriptorSet
    public let device: Device

    init(pointer: VkDescriptorSet,
        device: Device) {
        self.pointer = pointer
        self.device = device
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
            DescriptorSet(pointer: $0!, device: device)
        }
    }

    public class func update(
        device: Device,
        descriptorWrites: [WriteDescriptorSet]? = nil,
        descriptorCopies: [CopyDescriptorSet]? = nil
    ) {
        var descriptorWrites = descriptorWrites

        if descriptorCopies != nil {
            fatalError("IMPLEMENT descriptorCopies")
        }

        vkUpdateDescriptorSets(
            device.pointer,
            UInt32(descriptorWrites?.count ?? 0), descriptorWrites?.vulkanArray,
            0, nil)
            /*UInt32(descriptorCopies?.count ?? 0), descriptorCopies?.vulkanPointer)*/
    }

    public class func free(device: Device, descriptorPool: DescriptorPool, descriptorSets: [DescriptorSet]) {
        vkFreeDescriptorSets(device.pointer, descriptorPool.pointer, UInt32(descriptorSets.count), descriptorSets.vulkan)
    }
}