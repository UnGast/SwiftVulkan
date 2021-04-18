import CVulkan

public struct AccelerationStructureBuildSizesInfoKHR: VulkanTypeWrapper {
  public var next: Any?
public var accelerationStructureSize: DeviceSize
public var updateScratchSize: DeviceSize
public var buildScratchSize: DeviceSize

  var vNext: [Any]? = nil

  public init(
    next: Any? = nil,
accelerationStructureSize: DeviceSize,
updateScratchSize: DeviceSize,
buildScratchSize: DeviceSize
  ) {
    self.next = next
self.accelerationStructureSize = accelerationStructureSize
self.updateScratchSize = updateScratchSize
self.buildScratchSize = buildScratchSize
  }

  public var vulkan: VkAccelerationStructureBuildSizesInfoKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
      return VkAccelerationStructureBuildSizesInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR,
pNext: vNext,
accelerationStructureSize: accelerationStructureSize.vulkan,
updateScratchSize: updateScratchSize.vulkan,
buildScratchSize: buildScratchSize.vulkan
      )
    }
  }
}