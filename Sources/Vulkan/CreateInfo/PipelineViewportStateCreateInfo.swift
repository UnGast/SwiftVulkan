import CVulkan

public struct PipelineViewportStateCreateInfo {
  public let viewports: [Viewport]
  public let scissors: [Rect2D]

  public init(viewports: [Viewport], scissors: [Rect2D]) {
    self.viewports = viewports
    self.scissors = scissors
  }
}