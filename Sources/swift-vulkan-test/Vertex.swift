import Foundation

public struct Vertex {
  public var position: Position3
  public var color: Color
  public var texCoord: Position2
}

public struct Position2 {
  public var x: Float
  public var y: Float
}

public struct Position3 {
  public var x: Float
  public var y: Float
  public var z: Float
}

public struct Color {
  public var r: Float
  public var g: Float
  public var b: Float
}