import GfxMath

public protocol Mesh {
  var vertices: [Vertex] { get }
  var indices: [UInt32] { get }
  var rotationQuaternion: Quaternion<Float> { get }
  var modelTransformation: FMat4 { get set }

  var transformedVertices: [Vertex] { get }
}

extension Mesh {
  public var transformedVertices: [Vertex] {
    vertices.map {
      Vertex(
        position: FVec3(Array(modelTransformation.matmul(FVec4($0.position.rotated(by: rotationQuaternion).elements + [1])).elements[0...2])),
        color: $0.color,
        texCoord: $0.texCoord
      )
    }
  }
} 