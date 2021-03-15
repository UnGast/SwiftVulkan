extension Int {
  public init(fromVulkan: Self) {
    self = fromVulkan
  }

  public init?(fromVulkan: Self?) {
    if let fromVulkan = fromVulkan {
      self = fromVulkan
    } else {
      return nil
    }
  }

  public var vulkan: Int {
    self
  }
}