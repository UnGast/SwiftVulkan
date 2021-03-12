import CVulkan

public struct DescriptorSetLayoutCreateFlags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public var vulkan: UInt32 {
          rawValue
        }

        public static let none = Self(rawValue: 0)
        public static let pushDescriptor = Self(rawValue: 0x00000001)
        public static let updateAfterBindPool = Self(rawValue: 0x00000002)
    }