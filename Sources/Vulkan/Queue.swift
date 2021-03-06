
import CVulkan

public class Queue {
    public let pointer: VkQueue

    public init(pointer: VkQueue) {
        self.pointer = pointer
    }

    public class func create(fromDevice device: Device, presentFamilyIndex: UInt32) -> Queue {
        var queueArr = [VkQueue?](repeating: VkQueue(bitPattern: 0), count: 1)
        vkGetDeviceQueue(device.pointer, UInt32(presentFamilyIndex), 0, &queueArr)

        return Queue(pointer: queueArr[0]!)
    }

    public func submit(submits: [SubmitInfo], fence: Fence?) throws {
        vkQueueSubmit(pointer, UInt32(submits.count), submits.vulkanPointer, fence?.pointer)
    }

    public func present(presentInfo: PresentInfoKHR) -> Result {
        vkQueuePresentKHR(pointer, presentInfo.vulkanPointer).toResult()
    }

    public func waitIdle() {
        vkQueueWaitIdle(pointer)
    }
}