//
// Created by Alexander Ubillus on 2019-02-28.
//

import CVulkan

public class CommandBufferAllocateInfo {

    public let commandPool: CommandPool
    public let level: CommandBufferLevel
    public let commandBufferCount: UInt32

    public init(commandPool: CommandPool,
                level: CommandBufferLevel,
                commandBufferCount: UInt32) {
        self.commandPool = commandPool
        self.level = level
        self.commandBufferCount = commandBufferCount
    }

    func toVulkan() -> VkCommandBufferAllocateInfo {
        return VkCommandBufferAllocateInfo(
                sType: VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
                pNext: nil,
                commandPool: self.commandPool.pointer,
                level: VkCommandBufferLevel(rawValue: self.level.rawValue),
                commandBufferCount: self.commandBufferCount
        )
    }
}

public class CommandBuffer: WrapperStruct {

    public let pointer: VkCommandBuffer

    init(pointer: VkCommandBuffer) {
        self.pointer = pointer
    }

    public class func allocate(device: Device, info: CommandBufferAllocateInfo) throws -> CommandBuffer {
        var output = VkCommandBuffer(bitPattern: 0) // *pOutput = NULL
        var opResult = VK_SUCCESS

        withUnsafePointer(to: info.toVulkan()) { _createInfo in
            let createInfoPtr = _createInfo
            withUnsafeMutablePointer(to: &output) { mut in
                let outputPtr = mut
                opResult = vkAllocateCommandBuffers(device.pointer, createInfoPtr, outputPtr)
            }
        }

        guard opResult == VK_SUCCESS else {
            throw opResult.toResult()
        }

        return CommandBuffer(pointer: output!)
    }

    public var vulkan: Optional<VkCommandBuffer> {
        Optional(pointer)
    }

    public func begin(_ beginInfo: CommandBufferBeginInfo) {
        vkBeginCommandBuffer(pointer, beginInfo.vulkanPointer) 
    }

    public func beginRenderPass(beginInfo: RenderPassBeginInfo, contents: SubpassContents) {
        vkCmdBeginRenderPass(pointer, beginInfo.vulkanPointer, contents.vulkan)
    }

    public func bindPipeline(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) {
        vkCmdBindPipeline(pointer, pipelineBindPoint.vulkan, pipeline.pointer)
    }

    public func draw(vertexCount: UInt32, instanceCount: UInt32, firstVertex: UInt32, firstInstance: UInt32) {
        vkCmdDraw(pointer, vertexCount, instanceCount, firstVertex, firstInstance)
    }

    public func endRenderPass() {
        vkCmdEndRenderPass(pointer)
    }

    public func end() {
        vkEndCommandBuffer(pointer)
    }
}
