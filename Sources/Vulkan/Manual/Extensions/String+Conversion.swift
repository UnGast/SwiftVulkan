extension String {
  public init(fromVulkan: UnsafePointer<CChar>) {
    self.init(cString: fromVulkan)
  }
}