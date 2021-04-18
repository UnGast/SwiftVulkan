extension ShaderStageFlags {
    public static var raygenKhr: Self {
        Self(rawValue: 0x00000100)
    }

    public static var closestHitKhr: Self {
        Self(rawValue: 0x00000200)
    }
}