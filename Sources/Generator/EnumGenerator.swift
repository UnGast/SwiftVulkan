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
    var caseNameBase = rawTypeName.camelCaseToSnakeCase()

    for enumCase in xml.enum {
      guard let rawName = enumCase.attributes["name"] else {
        continue
      }
      guard let value = enumCase.attributes["value"] else {
        continue
      }
      var mappedName = rawName.replacingOccurrences(of: caseNameBase, with: "").snakeCaseToCamelCase()
      mappedName = escapeIfSwiftKeyword(mappedName)
      cases.append("\(mappedName) = \(value)")
    }
  }

  private func generateTypeDefinition() -> String {
    """
    import CVulkan

    public enum \(mappedTypeName): UInt32, VulkanEnumTypeWrapper {
      case \(cases.joined(separator: ",\n"))

      public init(fromVulkan: \(rawTypeName)) {
        self.init(rawValue: fromVulkan.rawValue)!
      }

      public var vulkan: \(rawTypeName) {
        \(rawTypeName)(rawValue)
      }
    }
    """
  }
}