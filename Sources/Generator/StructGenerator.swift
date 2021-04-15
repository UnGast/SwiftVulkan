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
  private let registry: Registry

  var returnedOnly: Bool = false
  var rawTypeName: String = ""
  var mappedTypeName: String = ""
  var structureTypeEnumValue = ""

  var rawMembers = [RawMember]()
  var exposedMembers = [ExposedMember]()
  var pointerBackingProperties = [String]()
  var pointerBackingAssignments = [String]()
  var toCMemberMappings = [String: String]()
  var toSwiftMemberMappings = [String: String]()

  public init(fromXml xml: XML.Accessor, registry: Registry) {
    self.xml = xml
    self.registry = registry
  }

  public func generate() -> (typeName: String, definition: String) {
    returnedOnly = xml.attributes["returnedonly"] == "true"

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
        toCMemberMappings[rawMember.name] = structureTypeEnumValue
        continue

      case "pNext":
        toCMemberMappings[rawMember.name] = "nil"
        continue

      case "flags":
        // when it's optional, flags is probably reserved for later use, but not used right now 
        if rawMember.optional {
          toCMemberMappings[rawMember.name] = "flags?.vulkan ?? 0"

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
            toCMemberMappings[rawMember.name] = "UInt32(\(baseName)?.count ?? 0)"
          } else {
            toCMemberMappings[rawMember.name] = "UInt32(\(baseName).count)"
          }
        } else {
          processSimpleRawMember(rawMember)
        }
      
      case Regex("^pp.*?"):
        toCMemberMappings[rawMember.name] = "nil"
      
      case Regex("^p([A-Z].*)"):
        if (rawMember.type == "char") {
          processSimpleRawMember(rawMember)
          continue
        }

        var baseName = Regex.lastMatch!.captures[0]!
        baseName = baseName.first!.lowercased() + baseName.dropFirst()

        let backingPropertyName = "v" + baseName.first!.uppercased() + baseName.dropFirst()
        var pointerBackingPropertySingleType = rawMember.type

        if registry.isHandle(typeName: rawMember.type) {
          pointerBackingPropertySingleType += "?"
        }

        pointerBackingProperties.append("var \(backingPropertyName): [\(pointerBackingPropertySingleType)]? = nil")

        if rawMember.optional {
          pointerBackingAssignments.append("\(backingPropertyName) = \(baseName)?.vulkanArray")
        } else {
          pointerBackingAssignments.append("\(backingPropertyName) = \(baseName).vulkanArray")
        }

        toCMemberMappings[rawMember.name] = backingPropertyName

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
    let (swiftType, swiftConversion, cConversion) = mapMember(rawMember.xml, registry: registry)

    toCMemberMappings[rawMember.name] = "\(rawMember.name)\(cConversion)"
    toSwiftMemberMappings[rawMember.name] = "\(swiftConversion)"

    exposedMembers.append(ExposedMember(
      name: rawMember.name, type: swiftType, comment: rawMember.comment, optional: rawMember.optional
    ))
  }

  private func generateTypeDefinition() -> String {
    var definition = """
    import CVulkan

    public struct \(mappedTypeName): VulkanTypeWrapper {
      \(generateMemberDefinitions())

      \(generatePointerBackingProperties())

      public init(
        \(generateInitArguments())
      ) {
        \(generateInitializerAssignments())
      }


    """

    if returnedOnly {
      definition += """
        public init(fromVulkan vulkan: \(rawTypeName)) {
          self.init(
            \(generateSwiftConversionAssignments())
          )
        }

        public var vulkan: \(rawTypeName) {
          mutating get {
            fatalError("\(mappedTypeName) is a return-only type")
          }
        }
      """
    } else {
      definition += """
        public var vulkan: \(rawTypeName) {
          mutating get {
            \(generatePointerBackingAssignments())
            return \(rawTypeName)(
              \(generateCConversionAssignments())
            )
          }
        }
      """
    }

    definition += "\n}"

    return definition
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

  private func generateCConversionAssignments() -> String {
    rawMembers.map { rawMember in
      "\(rawMember.name): \(toCMemberMappings[rawMember.name] ?? "")"
    }.joined(separator: ",\n")
  }

  private func generateSwiftConversionAssignments() -> String {
    exposedMembers.map {
      "\($0.name): \(toSwiftMemberMappings[$0.name] ?? "")"
    }.joined(separator: ",\n")
  }
}


