import Foundation
import SwiftyXMLParser
import ArgumentParser

struct GeneratorCommand: ParsableCommand {
  @Flag var dryRun: Bool = false
  @Argument var filter: [String] = []

  func run() throws {
    let vulkanDefinitionsFileUrl = Bundle.module.url(forResource: "vk", withExtension: "xml")!

    let xml = try! XML.parse(try! String(contentsOf: vulkanDefinitionsFileUrl))

    let registry = Registry(fromXml: xml.registry)

    let generatedStructWhitelist = [
      "VkApplicationInfo",
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
      "VkWriteDescriptorSet",
      
      "VkEventCreateInfo",
      
      "VkBufferDeviceAddressInfo",
      "VkAccelerationStructureDeviceAddressInfoKHR",
      "VkAccelerationStructureGeometryTrianglesDataKHR",
      "VkAccelerationStructureGeometryKHR",
      "VkAccelerationStructureGeometryAabbsDataKHR",
      "VkAccelerationStructureGeometryInstancesDataKHR",
      "VkAccelerationStructureBuildGeometryInfoKHR",
      "VkAccelerationStructureBuildSizesInfoKHR",
      "VkAccelerationStructureBuildRangeInfoKHR",
      "VkAccelerationStructureInstanceKHR",
      "VkWriteDescriptorSetAccelerationStructureKHR"]

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
      "VkPipelineLayoutCreateFlags",

      "VkEventCreateFlags",

      "VkGeometryFlagsKHR",
      "VkGeometryInstanceFlagsKHR",
      "VkBuildAccelerationStructureFlagsKHR",
      "VkAccelerationStructureCreateFlagsKHR"
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
      "VkDynamicState",

      "VkGeometryTypeKHR",
      "VkAccelerationStructureTypeKHR",
      "VkBuildAccelerationStructureModeKHR",
      "VkIndexType",
      "VkAccelerationStructureBuildTypeKHR"
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
      let fileManager = FileManager()
      let path = fileManager.currentDirectoryPath + "/Sources/Vulkan/Generated/\(typeName).swift"
      if !fileManager.fileExists(atPath: path) {
        fileManager.createFile(atPath: path, contents: nil)
      }
      try typeDefinition.write(toFile: path, atomically: false, encoding: .utf8)
    }
  }
}

GeneratorCommand.main()