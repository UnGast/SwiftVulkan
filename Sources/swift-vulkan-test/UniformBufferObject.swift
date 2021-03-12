public struct UniformBufferObject {
  public var model: Mat4
  public var view: Mat4
  public var projection: Mat4

  public static var dataSize: Int {
    MemoryLayout<Float>.size * 16 * 3
  }

  public var data: [Float] {
    model.elements + view.elements + projection.elements
  }
}

public struct Mat4 {
  public var elements: [Float]

  public init(_ elements: [Float]) {
    if elements.count != 16 {
      fatalError("Mat4 needs 16 elements, got: \(elements.count)")
    }
    self.elements = elements
  }

  public static let zero = Self([Float](repeating: 0, count: 16))
}