import CVulkan

public enum GeometryTypeKHR: UInt32, VulkanEnumTypeWrapper {
  case vkGeometryTypeTrianglesKhr = 0,
vkGeometryTypeAabbsKhr = 1,
vkGeometryTypeInstancesKhr = 2

  public init(fromVulkan: VkGeometryTypeKHR) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkGeometryTypeKHR {
    VkGeometryTypeKHR(rawValue)
  }
}