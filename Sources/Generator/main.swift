import Path
import SwiftyXMLParser
import Foundation
import Regex

let vulkanDefinitionsFilePath = Path.cwd/"vk.xml"

let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFilePath))

for type in xml.registry.types.type {
  if type.attributes["category"] == "struct" {
    buildStruct(from: type)
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

func buildStruct(from xml: XML.Accessor) {
  var rawMembers = [TypeMember]()

  for member in xml.member {
    if let name = member["name"].text, let type = member.type.text {
      rawMembers.append(TypeMember(name: name, type: type, comment: member.comment.text))
    }
  }

  var transformedMembers = [TransformedTypeMember]()
  var resultMemberNameBlacklist = [String]()

  for (index, rawMember) in rawMembers.enumerated() {
    if rawMember.name == "pNext" {
      continue
    }

    if let match = Regex("^p([A-Z].*)").firstMatch(in: rawMember.name) {
      var baseName = match.captures[0] ?? ""
      baseName = (baseName.first?.lowercased() ?? "") + (String(baseName.dropFirst() ?? ""))
      let rawCountNameRegex = try! Regex(string: baseName + "Count")

      let rawPointerMember = rawMember
      if let rawCountMember = rawMembers.first(where: { rawCountNameRegex.matches($0.name) }) {
        transformedMembers.append(TransformedTypeMember(
          name: baseName,
          type: mapTypeNameToSwift(rawPointerMember.type),
          comment: rawPointerMember.comment,
          mapping: .nested(rawCount: rawCountMember, rawPointer: rawPointerMember)))
        
        resultMemberNameBlacklist.append(rawCountMember.name)
      }
    } else {
      transformedMembers.append(TransformedTypeMember(
        name: rawMember.name,
        type: mapTypeNameToSwift(rawMember.type),
        mapping: .simple(rawMember)
      ))
    }
  }

  transformedMembers = transformedMembers.filter { !(resultMemberNameBlacklist.contains($0.name)) }

  let result = """
  public struct \(mapTypeNameToSwift(xml.attributes["name"]!)) {
    \(transformedMembers.map {
      buildTransformedTypeMemberDefinition($0)
   }.joined(separator: "\n"))
  }
  """
  print("RESULT", result)
}

func buildTransformedTypeMemberDefinition(_ member: TransformedTypeMember) -> String {
  var memberString = ""
  if let comment = member.comment {
    memberString.append("/** \(comment)\n */")
  }
  memberString.append("public var \(member.name): \(member.type)")
  return memberString
}

func mapTypeNameToSwift(_ rawName: String) -> String {
  rawName.replacingFirst(matching: Regex("^Vk"), with: "")
}