import CVulkan

public enum PrimitiveTopology: UInt32, VulkanEnumTypeWrapper {
  case pointList = 0,
lineList = 1,
lineStrip = 2,
triangleList = 3,
triangleStrip = 4,
triangleFan = 5,
lineListWithAdjacency = 6,
lineStripWithAdjacency = 7,
triangleListWithAdjacency = 8,
triangleStripWithAdjacency = 9,
patchList = 10

  public init(fromVulkan: VkPrimitiveTopology) {
    self.init(rawValue: fromVulkan.rawValue)!
  }

  public var vulkan: VkPrimitiveTopology {
    VkPrimitiveTopology(rawValue)
  }
}