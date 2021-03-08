import CVulkan

public struct SubmitInfo: WrapperStruct {
  public var waitSemaphores: [Semaphore]
  public var waitDstStageMask: [PipelineStageFlags]?
  public var commandBuffers: [CommandBuffer]
  public var signalSemaphores: [Semaphore]

  public init(
    waitSemaphores: [Semaphore],
    waitDstStageMask: [PipelineStageFlags]?,
    commandBuffers: [CommandBuffer],
    signalSemaphores: [Semaphore]
  ) {
    self.waitSemaphores = waitSemaphores
    self.waitDstStageMask = waitDstStageMask
    self.commandBuffers = commandBuffers
    self.signalSemaphores = signalSemaphores
  }

  public var vulkan: VkSubmitInfo {
    let test = VkSubmitInfo(
      sType: VK_STRUCTURE_TYPE_SUBMIT_INFO,
      pNext: nil,
      waitSemaphoreCount: UInt32(waitSemaphores.count),
      pWaitSemaphores: waitSemaphores.vulkanPointer,
      pWaitDstStageMask: waitDstStageMask?.vulkanPointer,
      commandBufferCount: UInt32(commandBuffers.count),
      pCommandBuffers: commandBuffers.vulkanPointer,
      signalSemaphoreCount: UInt32(signalSemaphores.count),
      pSignalSemaphores: signalSemaphores.vulkanPointer
    )

    return test
  }
}