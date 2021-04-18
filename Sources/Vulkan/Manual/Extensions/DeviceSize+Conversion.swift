import CVulkan

extension DeviceSize {
  public init(fromVulkan: DeviceSize) {
    self = fromVulkan
  }

  public init?(fromVulkan: DeviceSize?) {
    if fromVulkan != nil {
      self = fromVulkan!
    } else {
      return nil
    }
  }
}