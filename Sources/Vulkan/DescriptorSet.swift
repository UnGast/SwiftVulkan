
import CVulkan

public class DescriptorSet {

    public let pointer: VkDescriptorSet
    public let device: Device

    init(pointer: VkDescriptorSet,
        device: Device) {
        self.pointer = pointer
        self.device = device
    }

    public class func allocate(device: Device, allocateInfo: DescriptorSetAllocateInfo) -> [DescriptorSet] {
        var pointers: [VkDescriptorSet?] = []
        
        vkAllocateDescriptorSets(
            device.pointer,
            allocateInfo.vulkanPointer,
            &pointers)
        
        return pointers.map {
            DescriptorSet(pointer: $0!, device: device)
        }
    }
}