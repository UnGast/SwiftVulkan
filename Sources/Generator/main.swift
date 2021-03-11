import Foundation
import Path
import Regex
import SwiftyXMLParser

let vulkanDefinitionsFilePath = Path.cwd / "vk.xml"

let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFilePath))

for type in xml.registry.types.type {
  if type.attributes["category"] == "struct" {
    if type.attributes["name"] == "VkFramebufferCreateInfo" {
      print(StructGenerator(fromXml: type).generate())
    }
  }
}

struct TypeMember {
  var name: String
  var type: String
  var comment: String?
}

struct TransformedTypeMember {
  var name: String
  var type: String
  var comment: String?
  var mapping: Mapping

  public enum Mapping {
    case simple(TypeMember)
    case nested(rawCount: TypeMember, rawPointer: TypeMember)
  }
}

class StructGenerator {
  private let xml: XML.Accessor

  var rawTypeName: String = ""
  var structureTypeEnumValue = ""
  var rawMembers = [TypeMember]()
  var transformedMembers = [TransformedTypeMember]()

  public init(fromXml xml: XML.Accessor) {
    self.xml = xml
  }

  public func generate() -> String {
    rawTypeName = xml.attributes["name"] ?? ""

    for member in xml.member {
      if member["name"].text == "sType" {
        structureTypeEnumValue = member.attributes["values"] ?? ""
      }
      if let name = member["name"].text, let type = member.type.text {
        rawMembers.append(TypeMember(name: name, type: type, comment: member.comment.text))
      }
    }

    var resultMemberNameBlacklist = [String]()

    for (index, rawMember) in rawMembers.enumerated() {
      if rawMember.name == "pNext" || rawMember.name == "sType" {
        continue
      }

      if let match = Regex("^p([A-Z].*)").firstMatch(in: rawMember.name) {
        var baseName = match.captures[0] ?? ""
        baseName = (baseName.first?.lowercased() ?? "") + (String(baseName.dropFirst() ?? ""))
        let rawCountNameRegex = try! Regex(string: baseName.dropLast() + "Count")

        let rawPointerMember = rawMember
        if let rawCountMember = rawMembers.first(where: { rawCountNameRegex.matches($0.name) }) {
          transformedMembers.append(
            TransformedTypeMember(
              name: baseName,
              type: mapTypeNameToSwift(rawPointerMember.type),
              comment: rawPointerMember.comment,
              mapping: .nested(rawCount: rawCountMember, rawPointer: rawPointerMember)))

          resultMemberNameBlacklist.append(rawCountMember.name)
        } else {
          fatalError("DID NOT FIND COUNT \(rawCountNameRegex)")
        }
      } else {
        transformedMembers.append(
          TransformedTypeMember(
            name: rawMember.name,
            type: mapTypeNameToSwift(rawMember.type),
            mapping: .simple(rawMember)
          ))
      }
    }

    transformedMembers = transformedMembers.filter {
      !(resultMemberNameBlacklist.contains($0.name))
    }

    let result = """
      public struct \(mapTypeNameToSwift(xml.attributes["name"]!)): WrapperStruct {
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
      """

      return result
  }

  private func generateMemberDefinitions() -> String {
    transformedMembers.map { member in
      var memberString = ""
      if let comment = member.comment {
        memberString.append("/** \(comment)\n */")
      }
      memberString.append("public var \(member.name): \(member.type)")
      return memberString
    }.joined(separator: "\n")
  }

  private func generateInitArguments() -> String {
    transformedMembers.map {
      "\($0.name): \($0.type)"
    }.joined(separator: ",\n")
  }

  private func generateInitializerAssignments() -> String {
    transformedMembers.map {
      "self.\($0.name) = \($0.name)"
    }.joined(separator: "\n")
  }

  private func generateBindingAssignments() -> String {
    transformedMembers.map { member in
      switch member.mapping {
      case let .simple(rawMember):
        return "\(rawMember.name): \(member.name)"
      case let .nested(rawCountMember, rawPointerMember):
        return """
        \(rawCountMember.name): UInt32(\(member.name).count),
        \(rawPointerMember.name): \(member.name).vulkanPointer
        """
      }
    }.joined(separator: ",\n")
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
