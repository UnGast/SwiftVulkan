import CVulkan

public struct BufferUsageFlags: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = BufferUsageFlags(rawValue: 0)
    public static let transferSrc = BufferUsageFlags(rawValue: 0x00000001)
    public static let transferDst = BufferUsageFlags(rawValue: 0x00000002)
    public static let uniformTexelBuffer = BufferUsageFlags(rawValue: 0x00000004)
    public static let storageTexelBuffer = BufferUsageFlags(rawValue: 0x00000008)
    public static let uniformBuffer = BufferUsageFlags(rawValue: 0x00000010)
    public static let storageBuffer = BufferUsageFlags(rawValue: 0x00000020)
    public static let indexBuffer = BufferUsageFlags(rawValue: 0x00000040)
    public static let vertexBuffer = BufferUsageFlags(rawValue: 0x00000080)
    public static let indirectBuffer = BufferUsageFlags(rawValue: 0x00000100)
    public static let transformFeedbackBuffer = BufferUsageFlags(rawValue: 0x00000800)
    public static let transformFeedbackCounterBuffer = BufferUsageFlags(rawValue: 0x00001000)
    public static let conditionalRendering = BufferUsageFlags(rawValue: 0x00000200)
    public static let rayTracing = BufferUsageFlags(rawValue: 0x00000400)
    public static let shaderDeviceAddress = BufferUsageFlags(rawValue: 0x00020000)
    public static let accelerationStructureStorageKhr = BufferUsageFlags(rawValue: 0x00100000)
    public static let accelerationStructureBuildInputReadOnlyKhr = BufferUsageFlags(rawValue: 0x00080000)

    public var vulkan: VkBufferUsageFlags {
        return VkBufferUsageFlags(self.rawValue)
    }
}