//
// Created by Alexander Ubillus on 2019-02-04.
//

import Foundation
import CVulkan

public class Fence: VulkanHandleTypeWrapper, VulkanTypeWrapper {
    public let device: Device
    public let pointer: VkFence

    init(device: Device, pointer: VkFence) {
        self.device = device
        self.pointer = pointer 
    }

    public convenience init(device: Device, createInfo: FenceCreateInfo) throws {
        var createInfo = createInfo
        var fencePointer = VkFence(bitPattern: 0)

        var opResult = VK_SUCCESS
        withUnsafePointer(to: createInfo.vulkan) {
            opResult = vkCreateFence(device.pointer, $0, nil, &fencePointer)
        }

        if opResult == VK_SUCCESS {
            self.init(device: device, pointer: fencePointer!)
            return
        }
        
        throw opResult.toResult()
    }

    public var status: Result {
        vkGetFenceStatus(device.pointer, pointer).toResult()
    }

    public var vulkan: Optional<VkFence> {
        Optional(pointer)
    }

    public func wait(timeout: UInt64) {
        Fence.wait(for: [self], waitAll: true, timeout: timeout)
    }

    public static func wait(for fences: [Fence], waitAll: Bool, timeout: UInt64) {
        var fences = fences
        vkWaitForFences(fences[0].device.pointer, UInt32(fences.count), fences.vulkan, waitAll.vulkan, timeout)
    }

    public func reset() {
        Fence.reset(fences: [self])
    }

    public static func reset(fences: [Fence]) {
        var fences = fences
        vkResetFences(fences[0].device.pointer, UInt32(fences.count), fences.vulkan)
    }

    override public func destroyUnderlying() {
        vkDestroyFence(device.pointer, pointer, nil)
    }
}
