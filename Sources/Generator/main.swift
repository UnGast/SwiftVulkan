import Foundation
import Path
import Regex
import SwiftyXMLParser

let vulkanDefinitionsFilePath = Path.cwd / "vk.xml"

let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFilePath))

let typeRegistry = TypeRegistry(fromXml: xml.registry.types.type)

let generatedStructWhitelist = [
  "VkFramebufferCreateInfo",
  "VkVertexInputAttributeDescription",
  "VkVertexInputBindingDescription",
  "VkBufferCopy",
  "VkDescriptorPoolCreateInfo",
  "VkDescriptorPoolSize",
  "VkDescriptorSetLayoutBinding",
  "VkDescriptorSetLayoutCreateInfo",
  "VkDescriptorSetAllocateInfo",
  "VkDescriptorImageInfo",
  "VkDescriptorBufferInfo",
  "VkWriteDescriptorSet"]

for type in xml.registry.types.type {
  if type.attributes["category"] == "struct" {
    if let rawName = type.attributes["name"], generatedStructWhitelist.contains(rawName) {
      let generator = StructGenerator(fromXml: type, typeRegistry: typeRegistry)
      let (typeName, definition) = generator.generate()
      print(definition)
      let path = Path.cwd/"Sources/Vulkan/Generated/Structs"/(typeName + ".swift")
      try path.touch()
      try definition.write(to: path)
    }
  }
}

class TypeRegistry {
  var handleTypeNames: [String] = []

  public init(fromXml xml: XML.Accessor) {
    for type in xml {
      switch type.attributes["category"] {
      case "handle":
        if let name = type["name"].text {
          handleTypeNames.append(name)
        }
      default:
        continue
      }
    }
  }

  public func isHandle(typeName: String) -> Bool {
    handleTypeNames.contains(typeName)
  }
}

class StructGenerator {
  struct ExposedMember {
    var name: String
    var type: String
    var comment: String?
  }

  struct RawMember {
    var name: String
    var type: String
    var optional: Bool
    var lengthMemberName: String?
    var comment: String?
  }

  private let xml: XML.Accessor
  private let typeRegistry: TypeRegistry

  var rawTypeName: String = ""
  var mappedTypeName: String = ""
  var structureTypeEnumValue = ""

  var rawMembers = [RawMember]()
  var memberMappings = [String: String]()
  var transformedMembers = [ExposedMember]()
  var exposedMembers = [ExposedMember]()

  public init(fromXml xml: XML.Accessor, typeRegistry: TypeRegistry) {
    self.xml = xml
    self.typeRegistry = typeRegistry
  }

  public func generate() -> (typeName: String, definition: String) {
    rawTypeName = xml.attributes["name"] ?? ""
    mappedTypeName = mapTypeNameToSwift(rawTypeName)

    for member in xml.member {
      if member["name"].text == "sType" {
        structureTypeEnumValue = member.attributes["values"] ?? ""
      }
      if let name = member["name"].text, let type = member.type.text {
        rawMembers.append(RawMember(
          name: name,
          type: type,
          optional: member.attributes["optional"] == "true",
          lengthMemberName: member.attributes["len"],
          comment: member.comment.text))
      }
    }

    for (index, rawMember) in rawMembers.enumerated() {
      switch rawMember.name {
      case "sType":
        memberMappings[rawMember.name] = structureTypeEnumValue
        continue

      case "pNext":
        memberMappings[rawMember.name] = "nil"
        continue

      /*case "flags":
        memberMappings[rawMember.name] = "flags.vulkan"

        exposedMembers.append(ExposedMember(
          name: "flags", type: mapTypeNameToSwift(rawMember.type), comment: rawMember.comment
        ))*/

      case Regex("^(.*?)Count"):
        let baseName = Regex.lastMatch!.captures[0]! + "s"

        let arrayPointerNameRegex = try! Regex(string: "^p\(baseName.first!.uppercased() + baseName.dropFirst())")
        if rawMembers.contains(where: { arrayPointerNameRegex.matches($0.name) }) {
          memberMappings[rawMember.name] = "UInt32(\(baseName).count)"
        } else {
          memberMappings[rawMember.name] = "\(rawMember.name)"

          exposedMembers.append(ExposedMember(
            name: rawMember.name, type: mapTypeNameToSwift(rawMember.type)
          ))
        }
      
      case Regex("^p([A-Z].*)"):
        var baseName = Regex.lastMatch!.captures[0]!
        baseName = baseName.first!.lowercased() + baseName.dropFirst()

        let arrayCountNameRegex = try! Regex(string: "^\(baseName.dropLast())Count")
        if rawMember.lengthMemberName != nil || rawMembers.contains(where: { arrayCountNameRegex.matches($0.name) }) {
          if rawMember.optional {
            memberMappings[rawMember.name] = "\(baseName)?.vulkanPointer"
          } else {
            memberMappings[rawMember.name] = "\(baseName).vulkanPointer"
          }

          exposedMembers.append(ExposedMember(
            name: baseName, type: "[\(mapTypeNameToSwift(rawMember.type))]" + (rawMember.optional ? "?" : "")
          ))
        } else {
          if typeRegistry.isHandle(typeName: rawMember.type) {
            memberMappings[rawMember.name] = "\(baseName).pointer"
          } else {
            memberMappings[rawMember.name] = "\(baseName).vulkan"
          }

          exposedMembers.append(ExposedMember(
            name: baseName, type: mapTypeNameToSwift(rawMember.type), comment: rawMember.comment
          ))
        }

      default:
        memberMappings[rawMember.name] = "\(rawMember.name).vulkan"

        exposedMembers.append(ExposedMember(
          name: rawMember.name, type: mapTypeNameToSwift(rawMember.type), comment: rawMember.comment
        ))
      }
    }

    let typeDefinition = """
      import CVulkan

      public struct \(mappedTypeName): WrapperStruct {
        \(generateMemberDefinitions())

        public init(
          \(generateInitArguments())
        ) {
          \(generateInitializerAssignments())
        }

        public var vulkan: \(rawTypeName) {
          \(rawTypeName)(
            \(generateBindingAssignments())
          )
        }
      }
      """

      return (mappedTypeName, typeDefinition)
  }

  private func generateMemberDefinitions() -> String {
    exposedMembers.map { member in
      var memberString = ""
      if let comment = member.comment {
        memberString.append("/** \(comment) */\n")
      }
      memberString.append("public var \(member.name): \(member.type)")
      return memberString
    }.joined(separator: "\n")
  }

  private func generateInitArguments() -> String {
    exposedMembers.map {
      "\($0.name): \($0.type)"
    }.joined(separator: ",\n")
  }

  private func generateInitializerAssignments() -> String {
    exposedMembers.map {
      "self.\($0.name) = \($0.name)"
    }.joined(separator: "\n")
  }

  private func generateBindingAssignments() -> String {
    rawMembers.map { rawMember in
      "\(rawMember.name): \(memberMappings[rawMember.name] ?? "")"
    }.joined(separator: ",\n")
    /*transformedMembers.map { member in
      switch member.name {
      case "sType":
        return "sType: \(structureTypeEnumValue)"
      case "pNext":
        return "pNext: nil"
      case "flags":
        return "flags: flags.vulkan"
      default:
        break
      }

      switch member.mapping {
      case let .simple(rawMember):
        if typeRegistry.isHandle(typeName: rawMember.type) {
          return "\(rawMember.name): \(member.name).vulkan"
        }
        return "\(rawMember.name): \(member.name)"
      case let .nested(rawCountMember, rawPointerMember):
        return """
        \(rawCountMember.name): UInt32(\(member.name).count),
        \(rawPointerMember.name): \(member.name).vulkanPointer
        """
      }
    }.joined(separator: ",\n")*/
  }
}

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

  case Regex("^Vk(.*)"):
    return Regex.lastMatch!.captures[0]!

  default:
    return rawName
  }
}
