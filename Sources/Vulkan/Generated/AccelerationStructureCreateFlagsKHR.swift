import CVulkan

public struct AccelerationStructureCreateFlagsKHR: OptionSet {
  public var rawValue: UInt32

  public var vulkan: VkAccelerationStructureCreateFlagsKHR {
    VkAccelerationStructureCreateFlagsKHR(rawValue)
  }

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public init(fromVulkan: VkAccelerationStructureCreateFlagsKHR) {
    self.rawValue = fromVulkan
  }

  public init?(fromVulkan: VkAccelerationStructureCreateFlagsKHR?) {
    if let fromVulkan = fromVulkan {
        self.rawValue = fromVulkan
    } else {
        return nil
    }
  }

  public static let vkAccelerationStructureCreateDeviceAddressCaptureReplayKhr = Self(rawValue: 1 << 0)
}

public struct AccelerationStructureCreateFlagBitsKHR: OptionSet {
  public var rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public var vulkan: VkAccelerationStructureCreateFlagBitsKHR {
    VkAccelerationStructureCreateFlagBitsKHR(rawValue)
  }

  public static let vkAccelerationStructureCreateDeviceAddressCaptureReplayKhr = Self(rawValue: 1 << 0)
}