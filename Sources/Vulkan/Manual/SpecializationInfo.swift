import CVulkan

public struct SpecializationInfo: VulkanTypeWrapper {
  /** Number of entries in the map */
public var mapEntryCount: UInt32?
public var mapEntries: [SpecializationMapEntry]
/** Size in bytes of pData */


  var vMapEntries: [VkSpecializationMapEntry]? = nil

  public init(
    mapEntryCount: UInt32? = nil,
mapEntries: [SpecializationMapEntry]
  ) {
    self.mapEntryCount = mapEntryCount
self.mapEntries = mapEntries
  }

  public var vulkan: VkSpecializationInfo {
    mutating get {
      vMapEntries = mapEntries.vulkanArray
      return VkSpecializationInfo(
        mapEntryCount: mapEntryCount?.vulkan ?? 0,
pMapEntries: vMapEntries,
dataSize: 0,
pData: nil
      )
    }
  }
}