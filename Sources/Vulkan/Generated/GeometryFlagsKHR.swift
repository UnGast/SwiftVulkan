import CVulkan

public struct GeometryFlagsKHR: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkGeometryFlagsKHR {
    VkGeometryFlagsKHR(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkGeometryFlagsKHR) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkGeometryFlagsKHR?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let vkGeometryOpaqueKhr = Self(rawValue: 1 << 0)
public static let vkGeometryNoDuplicateAnyHitInvocationKhr = Self(rawValue: 1 << 1)
}

public struct GeometryFlagBitsKHR: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkGeometryFlagBitsKHR {
    VkGeometryFlagBitsKHR(rawValue)
  }

  public static let vkGeometryOpaqueKhr = Self(rawValue: 1 << 0)
public static let vkGeometryNoDuplicateAnyHitInvocationKhr = Self(rawValue: 1 << 1)
}