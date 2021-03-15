import Foundation
import Path
import SwiftyXMLParser
import ArgumentParser

struct GeneratorCommand: ParsableCommand {
  @Flag var dryRun: Bool = false
  @Argument var filter: [String] = []

  func run() throws {
    let vulkanDefinitionsFilePath = Path.cwd / "vk.xml"

    let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFilePath))

    let typeRegistry = TypeRegistry(fromXml: xml.registry)

    let generatedStructWhitelist = [
      "VkPipelineColorBlendStateCreateInfo",
      "VkPipelineColorBlendAttachmentState",
      "VkMemoryBarrier",
      "VkBufferMemoryBarrier",
      "VkImageMemoryBarrier",
      "VkImageSubresourceRange",
      "VkImageViewCreateInfo",
      "VkComponentMapping",
      "VkBufferImageCopy",
      "VkImageSubresourceLayers",
      "VkOffset3D",
      "VkSamplerCreateInfo",
      "VkPhysicalDeviceProperties",
      "VkPhysicalDeviceLimits",
      "VkPhysicalDeviceSparseProperties"

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
      "VkPipelineColorBlendStateCreateFlags",
      "VkColorComponentFlags",
      "VkPipelineCreateFlags",
      "VkAccessFlags",
      "VkImageAspectFlags",
      "VkImageViewCreateFlags",
      "VkSamplerCreateFlags"
    ]

    let generatedEnumsWhitelist = [
      "VkBlendOp",
      "VkFilter",
      "VkSamplerMipmapMode",
      "VkSamplerAddressMode",
      "VkBorderColor",
      "VkCompareOp",
      "VkPhysicalDeviceType"
    ]

    for type in xml.registry.types.type {
      if let rawName = type.attributes["name"] ?? type["name"].text, isTypeToGenerate(name: rawName) {
        var generatorOutput: (String, String)? = nil

        if generatedStructWhitelist.contains(rawName) {
          let generator = StructGenerator(fromXml: type, typeRegistry: typeRegistry)
          generatorOutput = generator.generate()
        } else if generatedFlagsWhitelist.contains(rawName) {
          let generator = FlagsGenerator(rawTypeName: rawName, typeRegistry: typeRegistry)
          generatorOutput = generator.generate()
        }

        if let (typeName, typeDefinition) = generatorOutput {
          try processGeneratorOutput(typeName, typeDefinition)
        }
      }
    }

    for enumType in xml.registry.enums {
      if let rawName = enumType.attributes["name"], isTypeToGenerate(name: rawName) {
        if generatedEnumsWhitelist.contains(rawName) {
          let generator = EnumGenerator(fromXml: enumType)
          let (typeName, typeDefinition) = generator.generate()
          try processGeneratorOutput(typeName, typeDefinition)
        }
      }
    }
  }

  func isTypeToGenerate(name: String) -> Bool {
    filter.count == 0 || filter.contains(name)
  }

  func processGeneratorOutput(_ typeName: String, _ typeDefinition: String) throws {
    print(typeDefinition)
    if !dryRun {
      let path = Path.cwd/"Sources/Vulkan/Generated"/(typeName + ".swift")
      try path.touch()
      try typeDefinition.write(to: path)
    }
  }
}

GeneratorCommand.main()