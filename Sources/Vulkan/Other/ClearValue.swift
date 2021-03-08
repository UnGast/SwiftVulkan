import CVulkan

public protocol ClearValue: WrapperStruct {
}

extension ClearValue where Wrapped == VkClearValue {
  public func eraseToAny() -> AnyClearValue {
    AnyClearValue(self)
  }
}

public struct AnyClearValue: ClearValue {
  private let getVulkan: () -> VkClearValue

  public init<T: ClearValue>(_ wrapped: T) where T.Wrapped == VkClearValue {
    self.getVulkan = { wrapped.vulkan }
  }

  public var vulkan: VkClearValue {
    getVulkan()
  }
}

public enum ClearColorValue: ClearValue {
  case float32(Float, Float, Float, Float),
    int32(Int32, Int32, Int32, Int32),
    uint32(UInt32, UInt32, UInt32, UInt32)

  public var vulkan: VkClearValue {
    switch self {
    case let .float32(f1, f2, f3, f4):
      return VkClearValue(color: VkClearColorValue(
        float32: (f1, f2, f3, f4)
      ))
    case let .int32(f1, f2, f3, f4):
      return VkClearValue(color: VkClearColorValue(
        int32: (f1, f2, f3, f4)
      ))
    case let .uint32(f1, f2, f3, f4):
      return VkClearValue(color: VkClearColorValue(
        uint32: (f1, f2, f3, f4)
      ))
    }
  }
}