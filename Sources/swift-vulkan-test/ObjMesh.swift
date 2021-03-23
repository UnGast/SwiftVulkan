import CTinyObjLoader
import Foundation
import GfxMath

public class ObjMesh: Mesh {
  public var rotationQuaternion: Quaternion<Float> = .identity
  public var modelTransformation: FMat4 = .identity
  private let fileUrl: URL

  public var vertices: [Vertex] = []
  public var indices: [UInt32] = []

  public init(fileUrl: URL) {
    self.fileUrl = fileUrl
  }

  public func load() throws {
    vertices = []
    indices = []

    var pAttrib = UnsafeMutablePointer<tinyobj_attrib_t>.allocate(capacity: 1)
    tinyobj_attrib_init(pAttrib)
    var pShapes: UnsafeMutablePointer<tinyobj_shape_t>?
    var numShapes: Int = 0
    var pMaterials: UnsafeMutablePointer<tinyobj_material_t>?
    var numMaterials = 0

    fileUrl.absoluteString.withCString() {
      var mutable = UnsafeMutablePointer(mutating: $0)
      tinyobj_parse_obj(
        pAttrib,
        &pShapes,
        &numShapes,
        &pMaterials,
        &numMaterials,
        "",
        { stringUrl, _, _, _, dataPointerPointer, dataSizePointer in
          let typed = stringUrl?.assumingMemoryBound(to: Int8.self)
          let data = try! Data(contentsOf: URL(string: String(cString: typed!))!)
          let dataPointer = UnsafeMutableBufferPointer<Int8>.allocate(capacity: data.count)
          data.copyBytes(to: dataPointer)
          dataPointerPointer?.pointee = dataPointer.baseAddress
          dataSizePointer?.pointee = dataPointer.count
        }, mutable, UInt32(TINYOBJ_FLAG_TRIANGULATE))
    }

    let attrib = pAttrib.pointee;
    let shapes = Array(UnsafeBufferPointer(start: pShapes, count: numShapes))
    let materials = Array(UnsafeBufferPointer(start: pMaterials, count: numMaterials))
    pShapes?.deallocate()
    pMaterials?.deallocate()

    for shape in shapes {
      for faceIndex in shape.face_offset..<shape.face_offset + shape.length {
        for vertexIndex in 0..<3 {

          let rawVertex = attrib.faces[Int(faceIndex) * 3 + vertexIndex]

          let vertex = Vertex(
            position: FVec3(
              x: attrib.vertices[Int(rawVertex.v_idx * 3 + 0)],
              y: attrib.vertices[Int(rawVertex.v_idx * 3 + 1)],
              z: attrib.vertices[Int(rawVertex.v_idx * 3 + 2)]
            ), color: Color(
              r: 0, g: 0, b: 0, a: 0
            ), texCoord: FVec2(
              x: rawVertex.vt_idx > 0 ? attrib.texcoords[Int(rawVertex.vt_idx * 2 + 0)] : -1,
              y: rawVertex.vt_idx > 0 ? 1 - attrib.texcoords[Int(rawVertex.vt_idx * 2 + 1)] : -1
            )
          )

          vertices.append(vertex)
          indices.append(UInt32(vertices.count - 1))
        }
      }
    }
  }
}