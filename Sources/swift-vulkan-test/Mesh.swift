public protocol Mesh {
  var vertices: [Vertex] { get }
  var indices: [UInt32] { get }
}