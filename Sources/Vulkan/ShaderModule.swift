import Foundation
import CVulkan

public class ShaderModule {
  public let pointer: VkShaderModule 

  let device: Device

  init(rawModule: VkShaderModule, device: Device) {
    self.pointer = rawModule
    self.device = device
  }

  public convenience init(device: Device, createInfo: ShaderModuleCreateInfo) throws {
    var vkCreateInfo = VkShaderModuleCreateInfo()
    vkCreateInfo.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
    vkCreateInfo.pNext = nil
    vkCreateInfo.codeSize = createInfo.code.count

    let codePtr = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: createInfo.code.count / 4)
    let copiedCount = createInfo.code.copyBytes(to: codePtr)
    vkCreateInfo.pCode = UnsafePointer(codePtr.baseAddress)

    var shaderModulePtr = VkShaderModule(bitPattern: 0)
    var opResult = VK_ERROR_INITIALIZATION_FAILED
    withUnsafePointer(to: vkCreateInfo) {
      opResult = vkCreateShaderModule(device.pointer, $0, nil, &shaderModulePtr)
    }

    if opResult == VK_SUCCESS {
      self.init(rawModule: shaderModulePtr!, device: device)
      return
    }
    
    throw opResult.toResult()
  }

  deinit {
    vkDestroyShaderModule(device.pointer, pointer, nil)
  }
}
