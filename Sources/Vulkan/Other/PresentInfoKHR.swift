import CVulkan

public class PresentInfoKHR: WrapperStruct {
  public var waitSemaphores: [Semaphore]
  public var swapchains: [Swapchain]
  public var imageIndices: [UInt32]
  public var results: Void

  public init(
    waitSemaphores: [Semaphore],
    swapchains: [Swapchain],
    imageIndices: [UInt32],
    results: Void
  ) {
    self.waitSemaphores = waitSemaphores
    self.swapchains = swapchains
    self.imageIndices = imageIndices
    self.results = results
  }

  public var vulkan: VkPresentInfoKHR {
    VkPresentInfoKHR(
      sType: VK_STRUCTURE_TYPE_PRESENT_INFO_KHR,
      pNext: nil,
      waitSemaphoreCount: UInt32(waitSemaphores.count),
      pWaitSemaphores: waitSemaphores.vulkanPointer,
      swapchainCount: UInt32(swapchains.count),
      pSwapchains: swapchains.vulkanPointer,
      pImageIndices: imageIndices.vulkanPointer,
      pResults: nil
    )
  }
}