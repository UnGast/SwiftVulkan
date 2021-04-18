import CVulkan

public struct AccelerationStructureBuildGeometryInfoKHR: VulkanTypeWrapper {
  public var next: Any?
public var type: AccelerationStructureTypeKHR
public var flags: BuildAccelerationStructureFlagsKHR?
public var mode: BuildAccelerationStructureModeKHR
public var srcAccelerationStructure: AccelerationStructureKHR?
public var dstAccelerationStructure: AccelerationStructureKHR?
public var geometryCount: UInt32?
public var geometries: [AccelerationStructureGeometryKHR]?
public var scratchData: DeviceOrHostAddressKHR

  var vNext: [Any]? = nil
var vGeometries: [VkAccelerationStructureGeometryKHR]? = nil

  public init(
    next: Any? = nil,
type: AccelerationStructureTypeKHR,
flags: BuildAccelerationStructureFlagsKHR? = nil,
mode: BuildAccelerationStructureModeKHR,
srcAccelerationStructure: AccelerationStructureKHR? = nil,
dstAccelerationStructure: AccelerationStructureKHR? = nil,
geometryCount: UInt32? = nil,
geometries: [AccelerationStructureGeometryKHR]? = nil,
scratchData: DeviceOrHostAddressKHR
  ) {
    self.next = next
self.type = type
self.flags = flags
self.mode = mode
self.srcAccelerationStructure = srcAccelerationStructure
self.dstAccelerationStructure = dstAccelerationStructure
self.geometryCount = geometryCount
self.geometries = geometries
self.scratchData = scratchData
  }

  public var vulkan: VkAccelerationStructureBuildGeometryInfoKHR {
    mutating get {
      vNext = next == nil ? nil : [next!]
vGeometries = geometries?.vulkanArray
      return VkAccelerationStructureBuildGeometryInfoKHR(
        sType: VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR,
pNext: vNext,
type: type.vulkan,
flags: flags?.vulkan ?? 0,
mode: mode.vulkan,
srcAccelerationStructure: srcAccelerationStructure?.vulkan,
dstAccelerationStructure: dstAccelerationStructure?.vulkan,
geometryCount: geometryCount?.vulkan ?? 0,
pGeometries: vGeometries,
ppGeometries: nil,
scratchData: scratchData.vulkan
      )
    }
  }
}