//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

public class PhysicalDevice {
    public let instance: Instance
    public let pointer: VkPhysicalDevice

    public init(instance: Instance, pointer: VkPhysicalDevice) {
        self.instance = instance
        self.pointer = pointer
    }

    public lazy var properties: PhysicalDeviceProperties = {
        let cProps = UnsafeMutablePointer<VkPhysicalDeviceProperties>.allocate(capacity: 1)
        defer {
            cProps.deallocate()
        }

        vkGetPhysicalDeviceProperties(self.pointer, cProps)
        let prop = cProps.pointee

        return PhysicalDeviceProperties(fromVulkan: prop)
    }()

    public lazy var queueFamilyProperties: [QueueFamilyProperties] = {
        var result: [QueueFamilyProperties] = []
        var countArr: [UInt32] = [0]

        vkGetPhysicalDeviceQueueFamilyProperties(self.pointer, &countArr, nil)
        
        var count = Int(countArr[0])
        if count > 0 {
            var properties = [VkQueueFamilyProperties](repeating: VkQueueFamilyProperties(), count: count)
            vkGetPhysicalDeviceQueueFamilyProperties(self.pointer, &countArr, &properties)
          
            var counter = 0
            for cProp in properties {
                let newProp = QueueFamilyProperties(
                    index: UInt32(counter),
                    queueFlags: QueueFamilyProperties.Flags(rawValue: cProp.queueFlags),
                    queueCount: cProp.queueCount,
                    timestampValidBits: cProp.timestampValidBits,
                    minImageTransferGranularity: cProp.minImageTransferGranularity.swiftVersion()
                )
                counter += 1

                result.append(newProp)
            }
        }

        return result
    }()

    public lazy var features: PhysicalDeviceFeatures = {
        let featuresPtr = UnsafeMutablePointer<VkPhysicalDeviceFeatures>.allocate(capacity: 1)
        defer {
            featuresPtr.deallocate()
        }

        vkGetPhysicalDeviceFeatures(self.pointer, featuresPtr)
        let features = featuresPtr.pointee

        return PhysicalDeviceFeatures(
            vkFeatures: features
        )
    }()

    public func getExtensionProperties<T>(type: T) -> T {
        var extensionProperties = type
        withUnsafeMutablePointer(to: &extensionProperties) {
            var basicProperties = VkPhysicalDeviceProperties()
            var propertiesContainer = VkPhysicalDeviceProperties2(
                sType: VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2,
                pNext: $0,
                properties: basicProperties
            )
            vkGetPhysicalDeviceProperties2(pointer, &propertiesContainer)
        }
        return extensionProperties
    }

    public func getFormatProperties(for format: Format) -> FormatProperties {
        var props = [ VkFormatProperties() ]
        vkGetPhysicalDeviceFormatProperties(self.pointer, format.vulkan, &props)

        return FormatProperties(props[0]) 
    }

    public func getExtensionProperties() throws -> [ExtensionProperties] {
        var countArr: [UInt32] = [ 0 ]
        var opResult = vkEnumerateDeviceExtensionProperties(self.pointer, nil, &countArr, nil)

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        var vkProperties = [VkExtensionProperties](repeating: VkExtensionProperties(), count: Int(countArr[0]))
        opResult = vkEnumerateDeviceExtensionProperties(self.pointer, nil, &countArr, &vkProperties)

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return vkProperties.map { ExtensionProperties(props: $0) }
    }

    public func getMemoryProperties() throws -> PhysicalDeviceMemoryProperties {

        var properties = [VkPhysicalDeviceMemoryProperties()]
        vkGetPhysicalDeviceMemoryProperties(self.pointer, &properties)

        return PhysicalDeviceMemoryProperties(properties[0])
    }

    public func getSurfaceFormats(for surface: SurfaceKHR) throws -> [SurfaceFormat] {
        
        var returnValue: [SurfaceFormat] = []
        var opResult = VK_SUCCESS

        var count = UInt32(0)
        withUnsafeMutablePointer(to: &count) { countPtr in
            opResult = vkGetPhysicalDeviceSurfaceFormatsKHR(
                self.pointer, surface.pointer, countPtr, nil)
        }

        if opResult != VK_SUCCESS {
            throw opResult.toResult()
        }

        if count > 0 {
            var cFormats = UnsafeMutablePointer<VkSurfaceFormatKHR>.allocate(capacity: Int(count))
            defer {
                cFormats.deallocate()
            }

            withUnsafeMutablePointer(to: &count) { c in
                let countPtr = c
                opResult = vkGetPhysicalDeviceSurfaceFormatsKHR(
                        self.pointer, surface.pointer, countPtr, cFormats)
            }

            if opResult != VK_SUCCESS {
                throw opResult.toResult()
            }

            if count > 0 {
                for i in 0..<count {
                    let format = cFormats[Int(i)]
                    let newFormat = SurfaceFormat(
                        format: Format(rawValue: format.format.rawValue)!,
                        colorSpace: ColorSpace(rawValue: format.colorSpace.rawValue)!
                    )

                    returnValue.append(newFormat)
                }
            }
        }
        
        return returnValue
    }

    public func hasSurfaceSupport(for family: QueueFamilyProperties, surface: SurfaceKHR) throws -> Bool {
        var vulkanBool: VkBool32 = 0
        var opResult = VK_SUCCESS
        withUnsafeMutablePointer(to: &vulkanBool) {
            opResult = vkGetPhysicalDeviceSurfaceSupportKHR(self.pointer, family.index, surface.pointer, $0)
        }
        
        if opResult == VK_SUCCESS {
            return vulkanBool > 0
        }

        throw opResult.toResult()
    }

    public func getSurfaceCapabilities(surface surf: SurfaceKHR) throws -> SurfaceCapabilities {
        var cCapabilities = VkSurfaceCapabilitiesKHR()

        var opResult = VK_SUCCESS
        withUnsafeMutablePointer(to: &cCapabilities) {
            opResult = vkGetPhysicalDeviceSurfaceCapabilitiesKHR(self.pointer, surf.pointer, $0)
        }
        
        if opResult == VK_SUCCESS {
            return SurfaceCapabilities(fromVulkan: cCapabilities)
        }

        throw opResult.toResult()
    }

    public func getSurfacePresentModes(surface surf: SurfaceKHR) throws -> [PresentMode] {
        var countArr = [UInt32](repeating: 0, count: 1)
        
        var opResult = vkGetPhysicalDeviceSurfacePresentModesKHR(
                self.pointer, surf.pointer, &countArr, nil)
        
        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        var cPresentModes = [VkPresentModeKHR](repeating: VkPresentModeKHR(rawValue: 0), count: Int(countArr[0]))
        opResult = vkGetPhysicalDeviceSurfacePresentModesKHR(
                self.pointer, surf.pointer, &countArr, &cPresentModes)
        
        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return cPresentModes.map { PresentMode(rawValue: $0.rawValue)! }
    }

    public func createDevice(createInfo info: DeviceCreateInfo) throws -> Device {
        var device = VkDevice(bitPattern: 0)

        var opResult = VK_SUCCESS
        info.vulkanExec() {
            withUnsafePointer(to: $0) { deviceCreatePtr in
                opResult = vkCreateDevice(self.pointer, deviceCreatePtr, nil, &device)
            }
        }
        
        if opResult == VK_SUCCESS {
            return Device(instance: instance, pointer: device!)
        }

        throw opResult.toResult()
    }
}
