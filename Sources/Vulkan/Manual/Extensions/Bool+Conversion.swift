import CVulkan

extension Bool {
  public init(fromVulkan: VkBool32) {
    self = fromVulkan > 0
  }

  public init?(fromVulkan: VkBool32?) {
    if let fromVulkan = fromVulkan {
      self = fromVulkan > 0
    } else {
      return nil
    }
  }
}