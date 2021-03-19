import Foundation
import GfxMath

public struct UniformBufferObject {
  public var model: FMat4
  public var view: FMat4
  public var projection: FMat4

  public static var dataSize: Int {
    MemoryLayout<Float>.size * 16 * 3
  }

  public var data: [Float] {
    model.elements + view.elements + projection.elements
  }
}

extension FMat4 {
  /*public var elements: [Float]

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

  public static let zero = Self([Float](repeating: 0, count: 16))*/

  public static func newProjection(aspectRatio: Float, fov: Float, near: Float, far: Float) -> FMat4 {
    //let screenDistance = Float(1)
    //let screenWidth = screenDistance * tan(fov / 2)
    //let screenHeight = screenWidth / aspectRatio 

    let f = cos(fov / 4) / sin(fov / 4)

    return FMat4([
      f, 0, 0, 0,
      0, -f, 0, 0,
      0, 0, far/(far - near), -(far * near / (far - near )),
      0, 0, 1, 0
    ])
  }

  public static func newRotation(forward: FVec3) -> FMat4 {
    let right = FVec3(0, 1, 0).cross(forward)
    let up = forward.cross(right)

    return FMat4([
      right.x, up.x, forward.x, 0,
      right.y, up.y, forward.y, 0,
      right.z, up.z, forward.z, 0,
      0, 0, 0, 1
    ])
  }

  public static func newRotation(yaw: Float, pitch: Float) -> FMat4 {
    let yawRad = yaw / 180 * Float.pi
    let pitchRad = pitch / 180 * Float.pi
    let x = sin(yawRad)
    let z = cos(yawRad) + cos(pitchRad)
    let y = sin(pitchRad)
    return newRotation(forward: FVec3(x, y, z))
  }

  /*public var transposed: Self {
    var result = [Float](repeating: 0, count: 16)
    for i in 0..<16 {
      result[i] = self.elements[(i % 4) * 4 + (i / 4)]
    }
    return Self(result)
  }*/
}