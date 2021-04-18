import CVulkan

public struct BufferDeviceAddressInfo: VulkanTypeWrapper {
  public var next: Any?
public var buffer: Buffer

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
buffer: Buffer
  ) {
    self.next = next
self.buffer = buffer
  }

  public var vulkan: VkBufferDeviceAddressInfo {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkBufferDeviceAddressInfo(
        sType: VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
pNext: vNext,
buffer: buffer.vulkan
      )
    }
  }
}