import Regex
import SwiftyXMLParser

func mapTypeNameToSwift(_ rawName: String) -> String {
  switch rawName {
  case "VkBool32":
    return "Bool"

  case "uint32_t":
    return "UInt32"

  case "uint8_t":
    return "UInt8"

  case "char":
    return "Char"

  case "float":
    return "Float"

  case Regex("^Vk(.*)"):
    return Regex.lastMatch!.captures[0]!

  default:
    return rawName
  }
}

func mapMemberTypeToSwift(_ member: XML.Accessor, typeRegistry: TypeRegistry) -> (swiftType: String, cConversion: String) {
  let cTypeName = member["type"].text!
  let swiftTypeName = mapTypeNameToSwift(cTypeName)
  var swiftType = swiftTypeName
  var cConversion = ".vulkan"

  if let tupleCount = Int(Regex("\\[([0-9])\\]").firstMatch(in: member.text ?? "")?.captures[0] ?? "") {
    swiftType = "(\(Array(repeating: swiftTypeName, count: tupleCount).joined(separator: ", ")))"
    cConversion = ""
  }

  if member.attributes["optional"] == "true" {
    swiftType += "?"

    if typeRegistry.isBitmask(typeName: cTypeName) {
      cConversion = "?" + cConversion + " ?? 0"
    } else {
      cConversion = "?" + cConversion
    }
  }

  return (swiftType, cConversion)
}