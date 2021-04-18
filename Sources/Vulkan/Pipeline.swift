import CVulkan

public class Pipeline: VulkanHandleTypeWrapper, VulkanTypeWrapper{
  public let pointer: VkPipeline
  public let device: Device

  private init(pointer: VkPipeline, device: Device) {
    self.pointer = pointer 
    self.device = device
  }

  public var vulkan: VkPipeline {
    pointer 
  }

  public convenience init(device: Device, createInfo: GraphicsPipelineCreateInfo) throws {
    var createInfo = createInfo
    var pipelinePointer = VkPipeline(bitPattern: 0)

    var opResult = VK_ERROR_INITIALIZATION_FAILED
    withUnsafePointer(to: createInfo.vulkan) {
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