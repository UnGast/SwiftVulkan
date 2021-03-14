import SwiftyXMLParser

public class TypeRegistry {
  public var types: [String: XML.Accessor] = [:]

  public init(fromXml xml: XML.Accessor) {
    for type in xml.types.type {
      if let name = type.attributes["name"] ?? type["name"].text {
        types[name] = type
      }
    }
    for enumType in xml.enums {
      if let name = enumType.attributes["name"] {
        types[name] = enumType
      }
    }
  }

  public func isHandle(typeName: String) -> Bool {
    if let xml = types[typeName] {
      return xml.attributes["category"] == "handle"
    }
    return false
  }

  public func isBitmask(typeName: String) -> Bool {
    if let xml = types[typeName] {
      return xml.attributes["category"] == "bitmask"
    }
    return false
  }
}