//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

public class Device {

    public let instance: Instance
    public let pointer: VkDevice

    init(instance: Instance,
         device: VkDevice) {
        self.instance = instance
        self.pointer = device
    }

    public func allocateDescriptorSets(allocateInfo info: DescriptorSetAllocateInfo) throws -> DescriptorSet {
        var descriptor = VkDescriptorSet(bitPattern: 0)

        let ai = VkDescriptorSetAllocateInfo(
            sType: VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO, 
            pNext: nil, 
            descriptorPool: info.descriptorPool.pointer, 
            descriptorSetCount: info.descriptorSetCount, 
            pSetLayouts: info.setLayouts.vulkanPointer 
        )

        let opResult = withUnsafePointer(to: ai) {
            return vkAllocateDescriptorSets(self.pointer, $0, &descriptor)
        }

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return DescriptorSet(pointer: descriptor!, device: self)
    }

    public func updateDescriptorSets(
        descriptorWrites: [WriteDescriptorSet]?, 
        descriptorCopies: [CopyDescriptorSet]?
    ) {
        if descriptorCopies != nil {
            fatalError("IMPLEMENT descriptorCopies")
        }

        vkUpdateDescriptorSets(
            self.pointer,
            UInt32(descriptorWrites?.count ?? 0), descriptorWrites?.vulkanPointer,
            0, nil)
            /*UInt32(descriptorCopies?.count ?? 0), descriptorCopies?.vulkanPointer)*/
    }

    public func waitIdle() {
        vkDeviceWaitIdle(pointer)
    }

    deinit {
        print("Destroying device")
        vkDestroyDevice(pointer, nil)
    }
}