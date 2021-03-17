extension StencilOpState {
  /** can use this value if the stencil op state does not need
  to be explicitly configured */
  public static var dontCare: StencilOpState {
    StencilOpState(
      failOp: .zero,
      passOp: .zero,
      depthFailOp: .zero,
      compareOp: .never,
      compareMask: 0,
      writeMask: 0,
      reference: 0
    )
  }
}