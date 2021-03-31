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

    let registry = Registry(fromXml: xml.registry)

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
      "VkPhysicalDeviceSparseProperties",
      "VkGraphicsPipelineCreateInfo",
      "VkPipelineTessellationStateCreateInfo",
      "VkPipelineDepthStencilStateCreateInfo",
      "VkPipelineVertexInputStateCreateInfo",
      "VkPipelineInputAssemblyStateCreateInfo",
      "VkPipelineRasterizationStateCreateInfo",
      "VkPipelineMultisampleStateCreateInfo",
      "VkPipelineColorBlendStateCreateInfo",
      "VkPipelineDynamicStateCreateInfo",
      "VkPipelineViewportStateCreateInfo",
      "VkStencilOpState",
      "VkPipelineShaderStageCreateInfo",
      "VkVertexInputAttributeDescription",
      "VkVertexInputBindingDescription",
      "VkRect2D",
      "VkViewport",
      "VkSpecializationMapEntry",
      "VkPipelineLayoutCreateInfo",
      "VkPushConstantRange",

      "VkFramebufferCreateInfo",
      "VkBufferCopy",
      "VkDescriptorPoolCreateInfo",
      "VkDescriptorPoolSize",
      "VkDescriptorSetLayoutBinding",
      "VkDescriptorSetLayoutCreateInfo",
      "VkDescriptorSetAllocateInfo",
      "VkDescriptorImageInfo",
      "VkDescriptorBufferInfo",
      "VkWriteDescriptorSet"]

    let generatedFlagsWhitelist = [
      "VkPipelineColorBlendStateCreateFlags",
      "VkColorComponentFlags",
      "VkPipelineCreateFlags",
      "VkAccessFlags",
      "VkImageAspectFlags",
      "VkImageViewCreateFlags",
      "VkSamplerCreateFlags",
      "VkPipelineDepthStencilStateCreateFlags",
      "VkPipelineTessellationStateCreateFlags",
      "VkPipelineViewportStateCreateFlags",
      "VkPipelineInputAssemblyStateCreateFlags",
      "VkPipelineVertexInputStateCreateFlags",
      "VkPipelineMultisampleStateCreateFlags",
      "VkPipelineRasterizationStateCreateFlags",
      "VkPipelineDynamicStateCreateFlags",
      "VkCullModeFlags",
      "VkSampleCountFlags",
      "VkPipelineShaderStageCreateFlags",
      "VkShaderStageFlags",
      "VkPipelineLayoutCreateFlags"
    ]

    let generatedEnumsWhitelist = [
      "VkBlendOp",
      "VkFilter",
      "VkSamplerMipmapMode",
      "VkSamplerAddressMode",
      "VkBorderColor",
      "VkCompareOp",
      "VkPhysicalDeviceType",
      "VkStencilOp",
      "VkPrimitiveTopology",
      "VkDynamicState"
    ]

    for type in xml.registry.types.type {
      if let rawName = type.attributes["name"] ?? type["name"].text, isTypeToGenerate(name: rawName) {
        var generatorOutput: (String, String)? = nil

        if generatedStructWhitelist.contains(rawName) {
          let generator = StructGenerator(fromXml: type, registry: registry)
          generatorOutput = generator.generate()
        } else if generatedFlagsWhitelist.contains(rawName) {
          let generator = FlagsGenerator(rawTypeName: rawName, registry: registry)
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