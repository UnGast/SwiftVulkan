import Regex
import SwiftyXMLParser

func mapTypeNameToSwift(_ rawName: String) -> String {
  switch rawName {
  case "VkBool32":
    return "Bool"

  case "uint32_t":
    return "UInt32"
  
  case "int32_t":
    return "Int32"

  case "uint8_t":
    return "UInt8"
  
  case "size_t":
    return "SizeT"

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

func mapMemberNameToSwift(_ cName: String) -> String {
  var cName = cName
  if Regex("^[0-9].*").matches(cName) {
    cName = "_" + cName
  }
  return escapeIfSwiftKeyword(cName)
}

func mapMember(_ member: XML.Accessor, vulkanStorageName: String = "vulkan", registry: Registry) -> (swiftType: String, swiftConversion: String, cConversion: String) {
  let cMemberName = member["name"].text ?? ""
  let cTypeName = member["type"].text!
  let swiftTypeName = mapTypeNameToSwift(cTypeName)
  var swiftType = swiftTypeName
  var swiftConversion = "\(swiftTypeName)(fromVulkan: \(vulkanStorageName).\(cMemberName))"
  var cConversion = ".vulkan"

  if registry.isStruct(typeName: cTypeName) {
    //swiftConversion = "\(swiftTypeName)(fromVulkan: \(vulkanStorageName).\(cMemberName))"

  } else if registry.isBitmask(typeName: cTypeName) {
    //swiftConversion = "\(swiftTypeName)(rawValue: \())"

  } else if cTypeName == "char" && Regex("\\[(.*?)\\]").matches(member.text ?? "") {
    swiftType = "String"
    swiftConversion = "\"FIXED LENGTH STRING CONVERSION NOT IMPLEMENTED\""//"String(fromVulkan: \(vulkanStorageName).\(cMemberName))"

  } else if let rawTupleCount = Regex("\\[(.*?)\\]").firstMatch(in: member.text ?? "")?.captures[0] { 
    var tupleCount: Int = Int(rawTupleCount) ?? 0

    if tupleCount == 0 {
      if let constantName = member.enum.text {
        tupleCount = Int(registry.constants[constantName] ?? "") ?? 0
      }
    }

    if tupleCount <= 4 {
      swiftType = "(\(Array(repeating: swiftTypeName, count: tupleCount).joined(separator: ", ")))"
      cConversion = ""
      swiftConversion = "\(vulkanStorageName).\(cMemberName)"
    } else {
      swiftType = "[\(swiftTypeName)]"
      cConversion = ""
      swiftConversion = "convertTupleToArray(\(vulkanStorageName).\(cMemberName))"
    }
  }

  if member.attributes["optional"] == "true" {
    swiftType += "?"

    if registry.isBitmask(typeName: cTypeName) {
      cConversion = "?" + cConversion + " ?? 0"
    } else {
      cConversion = "?" + cConversion
    }
  }

  return (swiftType, swiftConversion, cConversion)
}