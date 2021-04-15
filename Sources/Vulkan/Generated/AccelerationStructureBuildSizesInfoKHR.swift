import CVulkan

public struct AccelerationStructureBuildSizesInfoKHR: VulkanTypeWrapper {
  public var accelerationStructureSize: DeviceSize
public var updateScratchSize: DeviceSize
public var buildScratchSize: DeviceSize

  

  public init(
    accelerationStructureSize: DeviceSize,
updateScratchSize: DeviceSize,
buildScratchSize: DeviceSize
  ) {
    self.accelerationStructureSize = accelerationStructureSize
self.updateScratchSize = updateScratchSize
self.buildScratchSize = buildScratchSize
  }

  public var vulkan: VkAccelerationStructureBuildSizesInfoKHR {
    mutating get {
      
      return VkAccelerationStructureBuildSizesInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR,
pNext: nil,
accelerationStructureSize: accelerationStructureSize.vulkan,
updateScratchSize: updateScratchSize.vulkan,
buildScratchSize: buildScratchSize.vulkan
      )
    }
  }
}