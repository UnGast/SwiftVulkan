import CVulkan

public struct BufferDeviceAddressInfo: VulkanTypeWrapper {
  public var buffer: Buffer

  

  public init(
    buffer: Buffer
  ) {
    self.buffer = buffer
  }

  public var vulkan: VkBufferDeviceAddressInfo {
    mutating get {
      
      return VkBufferDeviceAddressInfo(
        sType: VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
pNext: nil,
buffer: buffer.vulkan
      )
    }
  }
}