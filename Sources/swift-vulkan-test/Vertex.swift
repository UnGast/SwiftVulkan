import Foundation
import GfxMath
import Vulkan

public struct Vertex {
  public var position: FVec3
  public var color: Color
  public var texCoord: FVec2

  public var data: [Float] {
    position.elements + [
      Float(color.r) / 255,
      Float(color.g) / 255,
      Float(color.b) / 255
    ] + texCoord.elements
  }

  public static var inputBindingDescription: VertexInputBindingDescription {
    VertexInputBindingDescription(
      binding: 0,
      stride: UInt32(MemoryLayout<Float>.size * 8),
      inputRate: .vertex
    )
  }

  public static var inputAttributeDescriptions: [VertexInputAttributeDescription] {
    [
      VertexInputAttributeDescription(
        location: 0,
        binding: 0,
        format: .R32G32B32_SFLOAT,
        offset: 0
      ),
      VertexInputAttributeDescription(
        location: 1,
        binding: 0,
        format: .R32G32B32_SFLOAT,
        offset: UInt32(MemoryLayout<Float>.size * 3)
      ),
      VertexInputAttributeDescription(
        location: 2,
        binding: 0,
        format: .R32G32_SFLOAT,
        offset: UInt32(MemoryLayout<Float>.size * 6)
      )
    ]
  }
}
/*
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
}*/