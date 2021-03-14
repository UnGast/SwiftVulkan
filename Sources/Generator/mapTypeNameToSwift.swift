import Regex

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