import GfxMath

public struct Camera {
  public var position: FVec3 = .zero
  /** in degrees */
  public var yaw: Float = 0
  /** in degrees */
  public var pitch: Float = 0

  public var forward: FVec3 {
    let yawRad = yaw / 180 * Float.pi
    let pitchRad = pitch / 180 * Float.pi
    let x = sin(yawRad)
    let z = cos(yawRad)
    let y = sin(pitchRad)
    return FVec3(x, y, z).normalized()
  }
  public var right: FVec3 {
    FVec3(0, 1, 0).cross(forward)
  }
  public var up: FVec3 {
    forward.cross(right)
  }

  public var viewMatrix: FMat4 {
    let forward = self.forward
    let right = self.right
    let up = self.up

    return FMat4([
      right.x, up.x, forward.x, 0,
      right.y, up.y, forward.y, 0,
      right.z, up.z, forward.z, 0,
      0, 0, 0, 1
    ]).transposed.matmul(FMat4([
      1, 0, 0, -position.x,
      0, 1, 0, -position.y,
      0, 0, 1, -position.z,
      0, 0, 0, 1
    ]))
  }
}