import CVulkan

public class Pipeline: WrapperClass {
  public let pointer: VkPipeline
  public let device: Device

  private init(pointer: VkPipeline, device: Device) {
    self.pointer = pointer 
    self.device = device
  }

  public convenience init(device: Device, createInfo: GraphicsPipelineCreateInfo) throws {
    var pipelinePointer = VkPipeline(bitPattern: 0)

    var opResult = VK_ERROR_INITIALIZATION_FAILED
    var mutCreateInfo = createInfo
    withUnsafePointer(to: mutCreateInfo.expVulkan) {
     opResult = vkCreateGraphicsPipelines(device.pointer, nil, 1, $0, nil, &pipelinePointer)
    } 

    if opResult == VK_SUCCESS {
      self.init(pointer: pipelinePointer!, device: device)
      return
    }

    throw opResult.toResult()
  }

  override public func destroyUnderlying() {
    vkDestroyPipeline(device.pointer, pointer, nil)
  }
}