import CVulkan

public enum DeviceOrHostAddressKHR: VulkanTypeWrapper {
  case device(DeviceAddress)
  case host(UnsafeMutableRawPointer?)

  public var vulkan: VkDeviceOrHostAddressKHR {
    mutating get {
      switch self {     
        case let .device(addr):
          return VkDeviceOrHostAddressKHR(
            deviceAddress: addr)
        case let .host(addr):
          return VkDeviceOrHostAddressKHR(
            hostAddress: addr)
      }
    }
  }
}