import GfxMath

public struct PlaneMesh: Mesh {

  public var rotationQuaternion: Quaternion<Float> = .identity
  public var modelTransformation: FMat4 = .identity

  public var vertices: [Vertex] = [
    Vertex(position: FVec3(x: -10, y: -10, z: 10), color: Color(r: 1, g: 255, b: 1, a: 1), texCoord: FVec2(x: 0, y: 0)),
    Vertex(position: FVec3(x: 10, y: -10, z: 10), color: Color(r: 1, g: 255, b: 1, a: 255), texCoord: FVec2(x: 1, y: 0)),
    Vertex(position: FVec3(x: 10, y: -10, z: -10), color: Color(r: 1, g: 1, b: 1, a: 255), texCoord: FVec2(x: 1, y: 1)),
    Vertex(position: FVec3(x: -10, y: -10, z: -10), color: Color(r: 1, g: 1, b: 1, a: 255), texCoord: FVec2(x: 0, y: 1))
  ]
  public var indices: [UInt32] = [
    0, 1, 2, 
    0, 2, 3
  ]
}