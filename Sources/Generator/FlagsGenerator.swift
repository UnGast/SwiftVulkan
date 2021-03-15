import SwiftyXMLParser

public class FlagsGenerator {
  private let registry: Registry
  private let rawTypeName: String
  private var mappedTypeName: String = ""
  private var bitsXml: XML.Accessor?
  private var bits: [String] = []

  public init(rawTypeName: String, registry: Registry) {
    self.rawTypeName = rawTypeName
    self.registry = registry
  }

  public func generate() -> (rawTypeName: String, typeDefinition: String) {
    let flagsXml = registry.types[rawTypeName]!
    mappedTypeName = mapTypeNameToSwift(self.rawTypeName)

    let flagBitsName = rawTypeName.replacingOccurrences(of: "Flags", with: "FlagBits")
    if let flagBitsXml = registry.types[flagBitsName] {
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

      public init(fromVulkan: \(rawTypeName)) {
        self.rawValue = fromVulkan
      }

      public init?(fromVulkan: \(rawTypeName)?) {
        if let fromVulkan = fromVulkan {
            self.rawValue = fromVulkan
        } else {
            return nil
        }
      }

      \(bits.joined(separator: "\n"))
    }
    """
  }
}