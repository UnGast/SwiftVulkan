import SwiftGUI
import SwiftGUIBackendSkia

class GUI {
  var surface: CpuBufferDrawingSurface? {
    didSet {
      updateDrawingContext()
    }
  }
  private let root: Root
  private var drawingContext: DrawingContext?

  public init() {
    root = Root(rootWidget: Container().withContent {
      Container().with(styleProperties: {
        (\.$width, 400)
        (\.$height, 400)
        (\.$background, .yellow)
      })

      Button().with(styleProperties: {
        (\.$background, .blue)
      }).withContent {
        Text("Hello World!").with(styleProperties: {
          (\.$foreground, .white)
        })
      }
    })
    root.setup(
      measureText: { _, _ in .zero },
      getKeyStates: { KeyStatesContainer() },
      getApplicationTime: { 0 },
      getRealFps: { 0 },
      requestCursor: { _ in {} })
  }

  private func updateDrawingContext() {
    if let surface = surface {
      let backend = SkiaCpuDrawingBackend(surface: surface)
      drawingContext = DrawingContext(backend: backend)
      root.bounds.size = DSize2(surface.size)
    } else {
      drawingContext = nil
    }
  }

  func update() {
    root.tick(Tick(deltaTime: 0, totalTime: 0))
    if let drawingContext = drawingContext {
      root.draw(drawingContext)
    }
  }
}