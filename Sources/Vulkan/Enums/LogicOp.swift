import CVulkan

public enum LogicOp: UInt32 {
  case clear = 0
  case and = 1
  case andReverse = 2
  case copy = 3
  case andInverted = 4
  case noOp = 5
  case xor = 6
  case or = 7
  case nor = 8
  case equivalent = 9
  case invert = 10
  case orReverse = 11
  case copyInverted = 12
  case orInverted = 13
  case nand = 14
  case `set` = 15

  public var vulkan: VkLogicOp {
    VkLogicOp(rawValue: self.rawValue)
  }
}