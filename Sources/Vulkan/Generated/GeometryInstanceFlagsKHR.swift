import CVulkan

public struct GeometryInstanceFlagsKHR: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkGeometryInstanceFlagsKHR {
    VkGeometryInstanceFlagsKHR(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkGeometryInstanceFlagsKHR) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkGeometryInstanceFlagsKHR?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let vkGeometryInstanceTriangleFacingCullDisableKhr = Self(rawValue: 1 << 0)
public static let vkGeometryInstanceTriangleFrontCounterclockwiseKhr = Self(rawValue: 1 << 1)
public static let vkGeometryInstanceForceOpaqueKhr = Self(rawValue: 1 << 2)
public static let vkGeometryInstanceForceNoOpaqueKhr = Self(rawValue: 1 << 3)
}

public struct GeometryInstanceFlagBitsKHR: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkGeometryInstanceFlagBitsKHR {
    VkGeometryInstanceFlagBitsKHR(rawValue)
  }

  public static let vkGeometryInstanceTriangleFacingCullDisableKhr = Self(rawValue: 1 << 0)
public static let vkGeometryInstanceTriangleFrontCounterclockwiseKhr = Self(rawValue: 1 << 1)
public static let vkGeometryInstanceForceOpaqueKhr = Self(rawValue: 1 << 2)
public static let vkGeometryInstanceForceNoOpaqueKhr = Self(rawValue: 1 << 3)
}