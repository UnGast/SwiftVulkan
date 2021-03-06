import Foundation

public struct ShaderModuleCreateInfo {
  public let code: Data

  public init(
    code: Data
  ) {
    self.code = code
  }
}
