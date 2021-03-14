import Regex
import SwiftyXMLParser

public class EnumGenerator {
  private let xml: XML.Accessor
  private var rawTypeName: String = ""
  private var mappedTypeName: String = ""
  private var cases: [String] = []

  public init(fromXml xml: XML.Accessor) {
    self.xml = xml
  }

  public func generate() -> (String, String) {
    rawTypeName = xml.attributes["name"]!
    mappedTypeName = mapTypeNameToSwift(rawTypeName)

    extractCases()

    let typeDefinition = generateTypeDefinition()

    return (mappedTypeName, typeDefinition)
  }

  private func extractCases() {
    var caseNameBase = ""
    for character in rawTypeName {
      if character.isLetter && character.isUppercase {
        caseNameBase += "_" + String(character)
      } else {
        caseNameBase += character.uppercased()
      }
    }
    caseNameBase.removeFirst()

    for enumCase in xml.enum {
      guard let rawName = enumCase.attributes["name"] else {
        continue
      }
      guard let value = enumCase.attributes["value"] else {
        continue
      }
      let nameParts = rawName.replacingOccurrences(of: caseNameBase, with: "").split(separator: "_")
      var mappedName = ""
      for (index, part) in nameParts.enumerated() {
        if index == 0 {
          mappedName += part.lowercased()
        } else {
          mappedName += String(part.first!) + String(part.dropFirst()).lowercased()
        }
      }
      cases.append("\(mappedName) = \(value)")
    }
  }

  private func generateTypeDefinition() -> String {
    """
    import CVulkan

    public enum \(mappedTypeName): UInt32 {
      case \(cases.joined(separator: ",\n"))

      public var vulkan: \(rawTypeName) {
        \(rawTypeName)(rawValue)
      }
    }
    """
  }
}