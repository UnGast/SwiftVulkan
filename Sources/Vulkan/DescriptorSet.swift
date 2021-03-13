
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
        var pointers: [VkDescriptorSet?] = Array(repeating: nil, count: Int(allocateInfo.descriptorSetCount))
        
        vkAllocateDescriptorSets(
            device.pointer,
            allocateInfo.vulkanPointer,
            &pointers)
        
        return pointers.map {
            DescriptorSet(pointer: $0!, device: device)
        }
    }
}