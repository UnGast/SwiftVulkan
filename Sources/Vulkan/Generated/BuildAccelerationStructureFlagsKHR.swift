import CVulkan

public struct BuildAccelerationStructureFlagsKHR: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkBuildAccelerationStructureFlagsKHR {
    VkBuildAccelerationStructureFlagsKHR(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkBuildAccelerationStructureFlagsKHR) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkBuildAccelerationStructureFlagsKHR?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let vkBuildAccelerationStructureAllowUpdateKhr = Self(rawValue: 1 << 0)
public static let vkBuildAccelerationStructureAllowCompactionKhr = Self(rawValue: 1 << 1)
public static let vkBuildAccelerationStructurePreferFastTraceKhr = Self(rawValue: 1 << 2)
public static let vkBuildAccelerationStructurePreferFastBuildKhr = Self(rawValue: 1 << 3)
public static let vkBuildAccelerationStructureLowMemoryKhr = Self(rawValue: 1 << 4)
}

public struct BuildAccelerationStructureFlagBitsKHR: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkBuildAccelerationStructureFlagBitsKHR {
    VkBuildAccelerationStructureFlagBitsKHR(rawValue)
  }

  public static let vkBuildAccelerationStructureAllowUpdateKhr = Self(rawValue: 1 << 0)
public static let vkBuildAccelerationStructureAllowCompactionKhr = Self(rawValue: 1 << 1)
public static let vkBuildAccelerationStructurePreferFastTraceKhr = Self(rawValue: 1 << 2)
public static let vkBuildAccelerationStructurePreferFastBuildKhr = Self(rawValue: 1 << 3)
public static let vkBuildAccelerationStructureLowMemoryKhr = Self(rawValue: 1 << 4)
}