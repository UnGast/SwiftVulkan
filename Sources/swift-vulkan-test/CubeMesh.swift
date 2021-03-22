import GfxMath

public class CubeMesh: Mesh {
  public var position: FVec3 = .zero
  public var rotationQuaternion: Quaternion<Float> = .identity
  public var modelTransformation: FMat4 = .identity

  public var vertices: [Vertex] {
    [
      // 0, top front left
      Vertex(position: FVec3(x: -0.5, y: 0.5, z: -0.5), color: .black, texCoord: FVec2(x: 0, y: 0)),
      // 1, top front right
      Vertex(position: FVec3(x: 0.5, y: 0.5, z: -0.5), color: .orange, texCoord: FVec2(x: 0, y: 0)),
      // 2, bottom front right
      Vertex(position: FVec3(x: 0.5, y: -0.5, z: -0.5), color: .blue, texCoord: FVec2(x: 0, y: 0)),
      // 3, bottom front left
      Vertex(position: FVec3(x: -0.5, y: -0.5, z: -0.5), color: .green, texCoord: FVec2(x: 0, y: 0)),
      // 4, top back left
      Vertex(position: FVec3(x: -0.5, y: 0.5, z: 0.5), color: .red, texCoord: FVec2(x: 0, y: 0)),
      // 5, top back right
      Vertex(position: FVec3(x: 0.5, y: 0.5, z: 0.5), color: .lightBlue, texCoord: FVec2(x: 0, y: 0)),
      // 6, bottom back left
      Vertex(position: FVec3(x: -0.5, y: -0.5, z: 0.5), color: .grey, texCoord: FVec2(x: 0, y: 0)),
      // 7, bottom back right
      Vertex(position: FVec3(x: 0.5, y: -0.5, z: 0.5), color: .white, texCoord: FVec2(x: 0, y: 0)),
    ]
  }
  
  public var indices: [UInt32] {
    [
      // front 
      0, 1, 2,
      0, 2, 3,
      // right
      1, 5, 7,
      1, 7, 2,
      // left
      4, 0, 3,
      4, 3, 6,
      // bottom
      3, 2, 7,
      3, 7, 6,
      // back
      5, 4, 6,
      5, 6, 7,
      // top
      4, 5, 1,
      4, 1, 0
    ]
  }
}