import SwiftyXMLParser

public class TypeRegistry {
  public var types: [String: XML.Accessor] = [:]

  public init(fromXml xml: XML.Accessor) {
    for type in xml {
      if let name = type.attributes["name"] ?? type["name"].text {
        types[name] = xml
      }
    }
  }

  public func isHandle(typeName: String) -> Bool {
    if let xml = types[typeName] {
      return xml.attributes["category"] == "handle"
    }
    return false
  }
}