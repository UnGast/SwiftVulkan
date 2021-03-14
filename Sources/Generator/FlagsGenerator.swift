import SwiftyXMLParser

public class FlagsGenerator {
  let typeName: String
  var mappedTypeName: String = ""
  let typeRegistry: TypeRegistry

  public init(typeName: String, typeRegistry: TypeRegistry) {
    self.typeName = typeName
    self.typeRegistry = typeRegistry
  }

  public func generate() -> (typeName: String, typeDefinition: String) {
    let flagsXml = typeRegistry.types[typeName]!
    mappedTypeName = mapTypeNameToSwift(self.typeName)

    let flagBitsName = typeName.replacingOccurrences(of: "Flags", with: "FlagBits")
    if let flagBitsXml = typeRegistry.types[flagBitsName] {
    } else {
    }

    return (mappedTypeName, generateDefinition())
  }

  private func generateDefinition() -> String {
    """
    public struct \(mappedTypeName): OptionSet {
      public var rawValue: UInt32

      public var vulkan: \(typeName) {
        \(typeName)(rawValue)
      }

      public init(rawValue: UInt32) {
        self.rawValue = rawValue
      }

      public static let none = Self(rawValue: 0)
    }
    """
  }
}