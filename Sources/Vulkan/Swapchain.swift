//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan
import Dispatch

public class Swapchain: VulkanHandleTypeWrapper, WrapperStruct {
    public let pointer: VkSwapchainKHR
    public let device: Device

    private let surface: SurfaceKHR

    public init(device: Device, pointer: VkSwapchainKHR, surface: SurfaceKHR) {
        self.pointer = pointer
        self.device = device
        self.surface = surface
    }

    public var vulkan: Optional<VkSwapchainKHR> {
        Optional(pointer)
    }

    public class func create(inDevice: Device, createInfo: SwapchainCreateInfo) throws -> Swapchain {
        var swapchain = VkSwapchainKHR(bitPattern: 0)

        var opResult = VK_SUCCESS
        var infoArr = [createInfo.toVulkan()]

        opResult = vkCreateSwapchainKHR(inDevice.pointer, &infoArr, nil, &swapchain)

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return Swapchain(device: inDevice, pointer: swapchain!, surface: createInfo.surface)
    }

    public func acquireNextImage(timeout: UInt64, semaphore: Semaphore?,
                                 fence: Fence?) throws -> (UInt32, Result) {
        var localImageIndex: UInt32 = 0
        let vkResult = vkAcquireNextImageKHR(
                self.device.pointer, self.pointer, timeout,
                semaphore?.vulkanValue, fence?.pointer, &localImageIndex)

        return (localImageIndex, vkResult.toResult())
    }

    public func getSwapchainImages() throws -> [Image] {
        var countArr: [UInt32] = [0]
        var opResult = vkGetSwapchainImagesKHR(self.device.pointer, self.pointer, &countArr, nil)

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        var images = [VkImage?](repeating: VkImage(bitPattern: 0), count: Int(countArr[0]))
        opResult = vkGetSwapchainImagesKHR(self.device.pointer, self.pointer, &countArr, &images)

        return images.map { Image(fromVulkan: $0!, device: self.device, swapchain: self) }
    }

    override public func destroyUnderlying() {
        vkDestroySwapchainKHR(device.pointer, self.pointer, nil)
    }
}
