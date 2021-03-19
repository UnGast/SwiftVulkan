import GfxMath

public class CubeMesh: Mesh {
  public var position: FVec3 = .zero

  public var vertices: [Vertex] {
    [
      Vertex(position: Position3(x: 0, y: 1, z: 1), color: Color(r: 1, g: 1, b: 0), texCoord: Position2(x: 0, y: 0)),
      Vertex(position: Position3(x: 1, y: 1, z: 1), color: Color(r: 1, g: 1, b: 0), texCoord: Position2(x: 0, y: 0)),
      Vertex(position: Position3(x: 1, y: 0, z: 1), color: Color(r: 1, g: 1, b: 0), texCoord: Position2(x: 0, y: 0)),
    ]
  }
  
  public var indices: [UInt32] {
    [0, 1, 2]
  }
}