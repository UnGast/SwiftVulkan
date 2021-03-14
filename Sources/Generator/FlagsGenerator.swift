import SwiftyXMLParser

public class FlagsGenerator {
  private let typeRegistry: TypeRegistry
  private let rawTypeName: String
  private var mappedTypeName: String = ""
  private var bitsXml: XML.Accessor?
  private var bits: [String] = []

  public init(rawTypeName: String, typeRegistry: TypeRegistry) {
    self.rawTypeName = rawTypeName
    self.typeRegistry = typeRegistry
  }

  public func generate() -> (rawTypeName: String, typeDefinition: String) {
    let flagsXml = typeRegistry.types[rawTypeName]!
    mappedTypeName = mapTypeNameToSwift(self.rawTypeName)

    let flagBitsName = rawTypeName.replacingOccurrences(of: "Flags", with: "FlagBits")
    if let flagBitsXml = typeRegistry.types[flagBitsName] {
      bitsXml = flagBitsXml
      extractBits()
      print("COLOR COMPONENT FLAGS BITS", flagBitsXml)
    }

    return (mappedTypeName, generateDefinition())
  }

  private func extractBits() {
    let bitBaseName = rawTypeName
      .replacingOccurrences(of: "Flags", with: "").camelCaseToSnakeCase()

    for bit in bitsXml!.enum {
      if let rawBitName = bit.attributes["name"], let value = bit.attributes["bitpos"] {
        let mappedName = rawBitName
          .replacingOccurrences(of: bitBaseName, with: "")
          .replacingOccurrences(of: "_BIT", with: "")
          .snakeCaseToCamelCase()
        bits.append("public static let \(mappedName) = Self(rawValue: 1 << \(value))")
      }
    } 
  }

  private func generateDefinition() -> String {
    """
    import CVulkan

    public struct \(mappedTypeName): OptionSet {
      public var rawValue: UInt32

      public var vulkan: \(rawTypeName) {
        \(rawTypeName)(rawValue)
      }

      public init(rawValue: UInt32) {
        self.rawValue = rawValue
      }

      \(bits.joined(separator: "\n"))
    }
    """
  }
}