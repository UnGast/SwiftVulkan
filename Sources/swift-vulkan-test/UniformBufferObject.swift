import Foundation

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

public struct Mat4: CustomDebugStringConvertible {
  public var elements: [Float]

  public var debugDescription: String {
    var result = ""
    for i in 0..<16 {
      result += String(elements[i]) + ", "
      if i % 4 == 3 {
        result += "\n"
      }
    }
    return result
  }

  public init(_ elements: [Float]) {
    if elements.count != 16 {
      fatalError("Mat4 needs 16 elements, got: \(elements.count)")
    }
    self.elements = elements
  }

  public static let zero = Self([Float](repeating: 0, count: 16))

  public static func projection(aspectRatio: Float, fov: Float) -> Mat4 {
    let near = Float(1.0)
    let screenWidth = 2 * near * tan(fov / 2)
    let screenHeight = screenWidth / aspectRatio 

    return Mat4([
      1/screenWidth, 0, 0, 0,
      0, 1/screenHeight, 0, 0,
      0, 0, 1, 0,
      0, 0, 1, 0
    ])
  }

  public var transposed: Self {
    var result = [Float](repeating: 0, count: 16)
    for i in 0..<16 {
      result[i] = self.elements[(i % 4) * 4 + (i / 4)]
    }
    return Self(result)
  }
}