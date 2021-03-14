import Foundation
import Path
import SwiftyXMLParser
import ArgumentParser

struct GeneratorCommand: ParsableCommand {
  @Flag var dryRun: Bool = false

  func run() throws {
    let vulkanDefinitionsFilePath = Path.cwd / "vk.xml"

    let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFilePath))

    let typeRegistry = TypeRegistry(fromXml: xml.registry.types.type)

    let generatedStructWhitelist = [
      "VkPipelineColorBlendStateCreateInfo",
      "VkPipelineColorBlendAttachmentState"

      /*"VkFramebufferCreateInfo",
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
      "VkWriteDescriptorSet"*/]

    let generatedFlagsWhitelist = [
      "VkPipelineColorBlendStateCreateFlags"
    ]

    for type in xml.registry.types.type {
      if let rawName = type.attributes["name"] ?? type["name"].text {
        var generatorOutput: (String, String)? = nil

        if generatedStructWhitelist.contains(rawName) {
          let generator = StructGenerator(fromXml: type, typeRegistry: typeRegistry)
          generatorOutput = generator.generate()
        } else if generatedFlagsWhitelist.contains(rawName) {
          let generator = FlagsGenerator(typeName: rawName, typeRegistry: typeRegistry)
          generatorOutput = generator.generate()
        }

        if let (typeName, typeDefinition) = generatorOutput {
          print(typeDefinition)
          if !dryRun {
            let path = Path.cwd/"Sources/Vulkan/Generated/Structs"/(typeName + ".swift")
            try path.touch()
            try typeDefinition.write(to: path)
          }
        }
      }
    }
  }
}

GeneratorCommand.main()