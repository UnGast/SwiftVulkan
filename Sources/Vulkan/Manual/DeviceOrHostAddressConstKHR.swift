import CVulkan

public enum DeviceOrHostAddressConstKHR: VulkanTypeWrapper {
  case none
  case device(DeviceAddress)
  case host(UnsafeRawPointer?)

  public var vulkan: VkDeviceOrHostAddressConstKHR {
    mutating get {
      switch self {     
        case .none:
          return VkDeviceOrHostAddressConstKHR()
        case let .device(addr):
          return VkDeviceOrHostAddressConstKHR(
            deviceAddress: addr)
        case let .host(addr):
          return VkDeviceOrHostAddressConstKHR(
            hostAddress: addr)
      }
    }
  }
}