import CVulkan
/*
public protocol WrapperFlag: ExpressibleByIntegerLiteral, Hashable {
  var value: UInt32 { get }

  init(integerLiteral value: UInt32)
}

extension Set: WrapperStruct where Element: WrapperFlag {
  public var vulkan: VkFlags {
    VkFlags(reduce(0 as UInt32) { $0 | $1.value })
  }
}*/