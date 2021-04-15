import CVulkan

public enum DeviceOrHostAddressKHR: VulkanTypeWrapper {
  case none
  case device(DeviceAddress)
  case host(UnsafeMutableRawPointer?)

  public var vulkan: VkDeviceOrHostAddressKHR {
    mutating get {
      switch self {     
        case .none:
          return VkDeviceOrHostAddressKHR()
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