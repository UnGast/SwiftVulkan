import CVulkan

public struct PhysicalDeviceSparseProperties: VulkanTypeWrapper {
  /** Sparse resources support: GPU will access all 2D (single sample) sparse resources using the standard sparse image block shapes (based on pixel format) */
public var residencyStandard2DBlockShape: Bool
/** Sparse resources support: GPU will access all 2D (multisample) sparse resources using the standard sparse image block shapes (based on pixel format) */
public var residencyStandard2DMultisampleBlockShape: Bool
/** Sparse resources support: GPU will access all 3D sparse resources using the standard sparse image block shapes (based on pixel format) */
public var residencyStandard3DBlockShape: Bool
/** Sparse resources support: Images with mip level dimensions that are NOT a multiple of the sparse image block dimensions will be placed in the mip tail */
public var residencyAlignedMipSize: Bool
/** Sparse resources support: GPU can consistently access non-resident regions of a resource, all reads return as if data is 0, writes are discarded */
public var residencyNonResidentStrict: Bool

  

  public init(
    residencyStandard2DBlockShape: Bool,
residencyStandard2DMultisampleBlockShape: Bool,
residencyStandard3DBlockShape: Bool,
residencyAlignedMipSize: Bool,
residencyNonResidentStrict: Bool
  ) {
    self.residencyStandard2DBlockShape = residencyStandard2DBlockShape
self.residencyStandard2DMultisampleBlockShape = residencyStandard2DMultisampleBlockShape
self.residencyStandard3DBlockShape = residencyStandard3DBlockShape
self.residencyAlignedMipSize = residencyAlignedMipSize
self.residencyNonResidentStrict = residencyNonResidentStrict
  }

  public init(fromVulkan vulkan: VkPhysicalDeviceSparseProperties) {
    self.init(
      residencyStandard2DBlockShape: Bool(fromVulkan: vulkan.residencyStandard2DBlockShape),
residencyStandard2DMultisampleBlockShape: Bool(fromVulkan: vulkan.residencyStandard2DMultisampleBlockShape),
residencyStandard3DBlockShape: Bool(fromVulkan: vulkan.residencyStandard3DBlockShape),
residencyAlignedMipSize: Bool(fromVulkan: vulkan.residencyAlignedMipSize),
residencyNonResidentStrict: Bool(fromVulkan: vulkan.residencyNonResidentStrict)
    )
  }

  public var vulkan: VkPhysicalDeviceSparseProperties {
    mutating get {
      fatalError("PhysicalDeviceSparseProperties is a return-only type")
    }
  }
}