import SwiftyXMLParser
import Regex

class StructGenerator {
  struct ExposedMember {
    var name: String
    var type: String
    var comment: String?
    var optional: Bool = false
  }

  struct RawMember {
    var name: String
    var type: String
    var optional: Bool
    var lengthMemberName: String?
    var comment: String?
    var xml: XML.Accessor
  }

  private let xml: XML.Accessor
  private let typeRegistry: TypeRegistry

  var rawTypeName: String = ""
  var mappedTypeName: String = ""
  var structureTypeEnumValue = ""

  var rawMembers = [RawMember]()
  var exposedMembers = [ExposedMember]()
  var pointerBackingProperties = [String]()
  var pointerBackingAssignments = [String]()
  var memberMappings = [String: String]()

  public init(fromXml xml: XML.Accessor, typeRegistry: TypeRegistry) {
    self.xml = xml
    self.typeRegistry = typeRegistry
  }

  public func generate() -> (typeName: String, definition: String) {
    rawTypeName = xml.attributes["name"] ?? ""
    mappedTypeName = mapTypeNameToSwift(rawTypeName)

    extractRawMembers()

    processRawMembers()

    let typeDefinition = generateTypeDefinition()

    return (mappedTypeName, typeDefinition)
  }

  private func extractRawMembers() {
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
          comment: member.comment.text,
          xml: member))
      }
    }
  }

  private func processRawMembers() {
    for (index, rawMember) in rawMembers.enumerated() {
      switch rawMember.name {
      case "sType":
        memberMappings[rawMember.name] = structureTypeEnumValue
        continue

      case "pNext":
        memberMappings[rawMember.name] = "nil"
        continue

      case "flags":
        // when it's optional, flags is probably reserved for later use, but not used right now 
        if rawMember.optional {
          memberMappings[rawMember.name] = "flags?.vulkan ?? 0"

          exposedMembers.append(ExposedMember(
            name: "flags", type: mapTypeNameToSwift(rawMember.type) + "?", comment: rawMember.comment, optional: true
          ))
        } else {
          processSimpleRawMember(rawMember)
        }

      case Regex("^(.*?)Count"):
        let baseName = Regex.lastMatch!.captures[0]! + "s"

        let arrayPointerNameRegex = try! Regex(string: "^p\(baseName.first!.uppercased() + baseName.dropFirst())")
        if let rawPointerMember = rawMembers.first(where: { arrayPointerNameRegex.matches($0.name) }) {
          if rawPointerMember.optional {
            memberMappings[rawMember.name] = "UInt32(\(baseName)?.count ?? 0)"
          } else {
            memberMappings[rawMember.name] = "UInt32(\(baseName).count)"
          }
        } else {
          memberMappings[rawMember.name] = "\(rawMember.name)"

          exposedMembers.append(ExposedMember(
            name: rawMember.name, type: mapTypeNameToSwift(rawMember.type)
          ))
        }
      
      case Regex("^p([A-Z].*)"):
        var baseName = Regex.lastMatch!.captures[0]!
        baseName = baseName.first!.lowercased() + baseName.dropFirst()

        if typeRegistry.isHandle(typeName: rawMember.type) {
          if rawMember.optional {
            memberMappings[rawMember.name] = "\(baseName)?.vulkan"
          } else {
            memberMappings[rawMember.name] = "\(baseName).vulkan"
          }
        } else {
          let backingPropertyName = "v" + baseName.first!.uppercased() + baseName.dropFirst()

          pointerBackingProperties.append("var \(backingPropertyName): [\(rawMember.type)]? = nil")

          if rawMember.optional {
            pointerBackingAssignments.append("\(backingPropertyName) = \(baseName)?.vulkanArray")
          } else {
            pointerBackingAssignments.append("\(backingPropertyName) = \(baseName).vulkanArray")
          }

          memberMappings[rawMember.name] = backingPropertyName
        }

        //let arrayCountNameRegex = try! Regex(string: "^\(baseName.dropLast())Count")
        if rawMember.lengthMemberName != nil/* || rawMembers.contains(where: { arrayCountNameRegex.matches($0.name) })*/ {
          exposedMembers.append(ExposedMember(
            name: baseName,
            type: "[\(mapTypeNameToSwift(rawMember.type))]" + (rawMember.optional ? "?" : ""),
            optional: rawMember.optional
          ))
        } else {
          exposedMembers.append(ExposedMember(
            name: baseName,
            type: mapTypeNameToSwift(rawMember.type) + (rawMember.optional ? "?" : ""),
            comment: rawMember.comment,
            optional: rawMember.optional
          ))
        }

      default:
        processSimpleRawMember(rawMember)
      }
    }
  }

  private func processSimpleRawMember(_ rawMember: RawMember) {
    let (swiftType, cConversion) = mapMemberTypeToSwift(rawMember.xml, typeRegistry: typeRegistry)

    memberMappings[rawMember.name] = "\(rawMember.name)\(cConversion)"

    exposedMembers.append(ExposedMember(
      name: rawMember.name, type: swiftType, comment: rawMember.comment, optional: rawMember.optional
    ))
  }

  private func generateTypeDefinition() -> String {
    """
    import CVulkan

    public struct \(mappedTypeName): VulkanTypeWrapper {
      \(generateMemberDefinitions())

      \(generatePointerBackingProperties())

      public init(
        \(generateInitArguments())
      ) {
        \(generateInitializerAssignments())
      }

      public var vulkan: \(rawTypeName) {
        mutating get {
          \(generatePointerBackingAssignments())
          return \(rawTypeName)(
            \(generateBindingAssignments())
          )
        }
      }
    }
    """
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

  private func generatePointerBackingProperties() -> String {
    pointerBackingProperties.joined(separator: "\n")
  }

  private func generateInitArguments() -> String {
    exposedMembers.map {
      let base = "\($0.name): \($0.type)"
      if $0.optional {
        return base + " = nil"
      }
      return base
    }.joined(separator: ",\n")
  }

  private func generateInitializerAssignments() -> String {
    exposedMembers.map {
      "self.\($0.name) = \($0.name)"
    }.joined(separator: "\n")
  }

  private func generatePointerBackingAssignments() -> String {
    pointerBackingAssignments.joined(separator: "\n")
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


