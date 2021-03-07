import CVulkan

public class Pipeline {
  public let pointer: VkPipeline

  private init(rawPipeline: VkPipeline) {
    self.pointer = rawPipeline
  }

  public convenience init(device: Device, createInfo: GraphicsPipelineCreateInfo) throws {
    var rawPipeline = VkPipeline(bitPattern: 0)

    var opResult = VK_ERROR_INITIALIZATION_FAILED
    withUnsafePointer(to: createInfo.vulkan) {
      opResult = vkCreateGraphicsPipelines(device.pointer, nil, 1, $0, nil, &rawPipeline)
    } 

    if opResult == VK_SUCCESS {
      self.init(rawPipeline: rawPipeline!)
      return
    }

    throw opResult.toResult()
  }
}