
import CVulkan

/*public class DescriptorPoolCreateInfo: WrapperStruct {
    public var flags: Flags
    public var maxSets: UInt32
    public let poolSizes: [DescriptorPoolSize]

    public init(flags: Flags,
                maxSets: UInt32,
                poolSizes: [DescriptorPoolSize]) {
        self.flags = flags
        self.maxSets = maxSets
        self.poolSizes = poolSizes
    }

    public var value: VkDescriptorPoolCreateInfo {
        VkDescriptorPoolCreateInfo(
            sType: VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
            pNext: nil,
            flags: createInfo.flags.rawValue,
            maxSets: createInfo.maxSets,
            poolSizeCount: UInt32(createInfo.poolSizes.count),
            pPoolSizes: poolSizes
        )
    }

    public struct Flags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static let none = Flags(rawValue: 0)
        public static let freeDescriptorSet = Flags(rawValue: 0x00000001)
        public static let updateAfterBind = Flags(rawValue: 0x00000002)
    }
}*/

public struct DescriptorPoolCreateFlags: OptionSet, WrapperStruct {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public var vulkan: UInt32 {
        rawValue
    }

    public static let none = Self(rawValue: 0)
    public static let freeDescriptorSet = Self(rawValue: 0x00000001)
    public static let updateAfterBind = Self(rawValue: 0x00000002)
}

public class DescriptorPool: VulkanHandleTypeWrapper, WrapperStruct {

    public let pointer: VkDescriptorPool
    public let device: Device

    init(pointer: VkDescriptorPool, device: Device) {
        self.pointer = pointer
        self.device = device
    }

    public var vulkan: VkDescriptorPool {
        pointer
    }

    public class func create(device: Device, createInfo: DescriptorPoolCreateInfo) throws -> DescriptorPool {
        var createInfo = createInfo
        
        var pool = VkDescriptorPool(bitPattern: 0)

        let opResult = withUnsafePointer(to: createInfo.vulkan) {
            return vkCreateDescriptorPool(device.pointer, $0, nil, &pool)
        }
        
        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return DescriptorPool(pointer: pool!, device: device)
    }

    override public func destroyUnderlying() {
        vkDestroyDescriptorPool(device.pointer, self.pointer, nil)
    }
}