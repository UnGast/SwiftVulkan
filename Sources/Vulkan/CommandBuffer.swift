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

    public class func free(commandBuffers: [CommandBuffer], device: Device, commandPool: CommandPool) {
        vkFreeCommandBuffers(device.pointer, commandPool.pointer, UInt32(commandBuffers.count), commandBuffers.vulkanPointer)
    }

    public var vulkan: Optional<VkCommandBuffer> {
        Optional(pointer)
    }

    public func begin(_ beginInfo: CommandBufferBeginInfo) {
        vkBeginCommandBuffer(pointer, beginInfo.vulkanPointer) 
    }

    public func beginRenderPass(beginInfo: RenderPassBeginInfo, contents: SubpassContents) {
        var beginInfo = beginInfo
        vkCmdBeginRenderPass(pointer, beginInfo.vulkanArray, contents.vulkan)
    }

    public func bindPipeline(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) {
        vkCmdBindPipeline(pointer, pipelineBindPoint.vulkan, pipeline.pointer)
    }

    public func bindVertexBuffers(firstBinding: UInt32, buffers: [Buffer], offsets: [DeviceSize]) {
        vkCmdBindVertexBuffers(pointer, firstBinding, UInt32(buffers.count) - firstBinding, buffers.vulkanPointer, offsets.vulkanPointer)
    }

    public func bindIndexBuffer(buffer: Buffer, offset: DeviceSize, indexType: VkIndexType) {
        vkCmdBindIndexBuffer(pointer, buffer.pointer, offset, indexType)
    }

    public func pushConstants(layout: PipelineLayout, stageFlags: ShaderStageFlags, offset: UInt32, size: UInt32, values: UnsafeRawPointer) {
        vkCmdPushConstants(pointer, layout.pointer, stageFlags.vulkan, offset, size, values)
        /*void vkCmdPushConstants(
    VkCommandBuffer                             commandBuffer,
    VkPipelineLayout                            layout,
    VkShaderStageFlags                          stageFlags,
    uint32_t                                    offset,
    uint32_t                                    size,
    const void*                                 pValues);*/
    }

    public func draw(vertexCount: UInt32, instanceCount: UInt32, firstVertex: UInt32, firstInstance: UInt32) {
        vkCmdDraw(pointer, vertexCount, instanceCount, firstVertex, firstInstance)
    }

    public func drawIndexed(indexCount: UInt32, instanceCount: UInt32, firstIndex: UInt32, vertexOffset: Int32, firstInstance: UInt32) {
        vkCmdDrawIndexed(pointer, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance)
    }

    public func bindDescriptorSets(
        pipelineBindPoint: PipelineBindPoint,
        layout: PipelineLayout,
        firstSet: UInt32,
        descriptorSets: [DescriptorSet],
        dynamicOffsets: [UInt32]) {
            vkCmdBindDescriptorSets(
                pointer,
                pipelineBindPoint.vulkan,
                layout.pointer,
                firstSet,
                UInt32(descriptorSets.count),
                descriptorSets.vulkan,
                UInt32(dynamicOffsets.count),
                Optional(dynamicOffsets.vulkan))
    }

    public func pipelineBarrier(
        srcStageMask: PipelineStageFlags, dstStageMask: PipelineStageFlags, dependencyFlags: DependencyFlags,
        memoryBarriers: [MemoryBarrier], bufferMemoryBarriers: [BufferMemoryBarrier], imageMemoryBarriers: [ImageMemoryBarrier]) {
            var memoryBarriers = memoryBarriers
            var bufferMemoryBarriers = bufferMemoryBarriers
            var imageMemoryBarriers = imageMemoryBarriers
            vkCmdPipelineBarrier(pointer, srcStageMask.vulkan, dstStageMask.vulkan, dependencyFlags.rawValue,
                UInt32(memoryBarriers.count), memoryBarriers.vulkan, UInt32(bufferMemoryBarriers.count), bufferMemoryBarriers.vulkan,
                UInt32(imageMemoryBarriers.count), imageMemoryBarriers.vulkan) 
    }

    public func setEvent(event: Event, stageMask: PipelineStageFlags) {
        vkCmdSetEvent(pointer, event.pointer, stageMask.vulkan)
    }

    public func endRenderPass() {
        vkCmdEndRenderPass(pointer)
    }

    public func copyBuffer(srcBuffer: Buffer, dstBuffer: Buffer, regions: [BufferCopy]) {
        var regions = regions
        vkCmdCopyBuffer(pointer, srcBuffer.pointer, dstBuffer.pointer, UInt32(regions.count), regions.vulkanArray)
    }

    public func copyBufferToImage(srcBuffer: Buffer, dstImage: Image, dstImageLayout: ImageLayout, regions: [BufferImageCopy]) {
        var regions = regions
        vkCmdCopyBufferToImage(pointer, srcBuffer.vulkan, dstImage.vulkan, dstImageLayout.vulkan, UInt32(regions.count), regions.vulkanArray)
    }

    public func buildAccelerationStructuresKHR(device: Device, infos: [AccelerationStructureBuildGeometryInfoKHR], buildRangeInfos: [[AccelerationStructureBuildRangeInfoKHR]]) {
        var infos = infos
        var buildRangeInfos = buildRangeInfos
        let pvkCmdBuildAccelerationStructuresKHR = unsafeBitCast(
            vkGetDeviceProcAddr(device.pointer, "vkCmdBuildAccelerationStructuresKHR"),
            to: PFN_vkCmdBuildAccelerationStructuresKHR.self)
        
        var mappedBuildRangeInfos = [UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?]()
        for index in 0..<buildRangeInfos.count {
            mappedBuildRangeInfos.append(buildRangeInfos[index].vulkan)
        }
        
        pvkCmdBuildAccelerationStructuresKHR(pointer, UInt32(infos.count), infos.vulkan, mappedBuildRangeInfos)
    }

    public func end() {
        vkEndCommandBuffer(pointer)
    }
}
