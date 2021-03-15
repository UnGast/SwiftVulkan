import SwiftyXMLParser

public class Registry {
  public var constants: [String: String] = [:]

  public var types: [String: XML.Accessor] = [:]

  public init(fromXml xml: XML.Accessor) {
    for type in xml.types.type {
      if let name = type.attributes["name"] ?? type["name"].text {
        types[name] = type
      }
    }
    for enumType in xml.enums {
      if let name = enumType.attributes["name"] {
        if name == "API Constants" {
          print("GOT API CONSTANTS")
          for constant in enumType.enum {
            if let constantName = constant.attributes["name"], let constantValue = constant.attributes["value"] {
              print("CONSTANT", constantName, constantValue)
              constants[constantName] = constantValue
            }
          }
        } else {
          types[name] = enumType
        }
      }
    }
  }

  public func isStruct(typeName: String) -> Bool {
    if let xml = types[typeName] {
      return xml.attributes["category"] == "struct"
    }
    return false
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