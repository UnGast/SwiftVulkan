import GfxMath

public protocol Mesh {
  var vertices: [Vertex] { get }
  var indices: [UInt32] { get }
  var modelTransformation: FMat4 { get set }

  var transformedVertices: [Vertex] { get }
}

extension Mesh {
  public var transformedVertices: [Vertex] {
    []
  }
}