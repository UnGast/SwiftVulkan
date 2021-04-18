//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

public class Device: VulkanHandleTypeWrapper, VulkanTypeWrapper {

    public let instance: Instance
    public let pointer: VkDevice

    public init(instance: Instance,
         pointer: VkDevice) {
        self.instance = instance
        self.pointer = pointer 
    }

    public var vulkan: VkDevice? {
        pointer
    }

    public func waitIdle() {
        vkDeviceWaitIdle(pointer)
    }

    override public func destroyUnderlying() {
        vkDestroyDevice(pointer, nil)
    }
}