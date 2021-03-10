import CVulkan

public enum Format: UInt32, WrapperStruct {
  case UNDEFINED = 0
  case
    R4G4_UNORM_PACK8 = 1
  case
    R4G4B4A4_UNORM_PACK16 = 2
  case
    B4G4R4A4_UNORM_PACK16 = 3
  case
    R5G6B5_UNORM_PACK16 = 4
  case
    B5G6R5_UNORM_PACK16 = 5
  case
    R5G5B5A1_UNORM_PACK16 = 6
  case
    B5G5R5A1_UNORM_PACK16 = 7
  case
    A1R5G5B5_UNORM_PACK16 = 8
  case
    R8_UNORM = 9
  case
    R8_SNORM = 10
  case
    R8_USCALED = 11
  case
    R8_SSCALED = 12
  case
    R8_UINT = 13
  case
    R8_SINT = 14
  case
    R8_SRGB = 15
  case
    R8G8_UNORM = 16
  case
    R8G8_SNORM = 17
  case
    R8G8_USCALED = 18
  case
    R8G8_SSCALED = 19
  case
    R8G8_UINT = 20
  case
    R8G8_SINT = 21
  case
    R8G8_SRGB = 22
  case
    R8G8B8_UNORM = 23
  case
    R8G8B8_SNORM = 24
  case
    R8G8B8_USCALED = 25
  case
    R8G8B8_SSCALED = 26
  case
    R8G8B8_UINT = 27
  case
    R8G8B8_SINT = 28
  case
    R8G8B8_SRGB = 29
  case
    B8G8R8_UNORM = 30
  case
    B8G8R8_SNORM = 31
  case
    B8G8R8_USCALED = 32
  case
    B8G8R8_SSCALED = 33
  case
    B8G8R8_UINT = 34
  case
    B8G8R8_SINT = 35
  case
    B8G8R8_SRGB = 36
  case
    R8G8B8A8_UNORM = 37
  case
    R8G8B8A8_SNORM = 38
  case
    R8G8B8A8_USCALED = 39
  case
    R8G8B8A8_SSCALED = 40
  case
    R8G8B8A8_UINT = 41
  case
    R8G8B8A8_SINT = 42
  case
    R8G8B8A8_SRGB = 43
  case
    B8G8R8A8_UNORM = 44
  case
    B8G8R8A8_SNORM = 45
  case
    B8G8R8A8_USCALED = 46
  case
    B8G8R8A8_SSCALED = 47
  case
    B8G8R8A8_UINT = 48
  case
    B8G8R8A8_SINT = 49
  case
    B8G8R8A8_SRGB = 50
  case
    A8B8G8R8_UNORM_PACK32 = 51
  case
    A8B8G8R8_SNORM_PACK32 = 52
  case
    A8B8G8R8_USCALED_PACK32 = 53
  case
    A8B8G8R8_SSCALED_PACK32 = 54
  case
    A8B8G8R8_UINT_PACK32 = 55
  case
    A8B8G8R8_SINT_PACK32 = 56
  case
    A8B8G8R8_SRGB_PACK32 = 57
  case
    A2R10G10B10_UNORM_PACK32 = 58
  case
    A2R10G10B10_SNORM_PACK32 = 59
  case
    A2R10G10B10_USCALED_PACK32 = 60
  case
    A2R10G10B10_SSCALED_PACK32 = 61
  case
    A2R10G10B10_UINT_PACK32 = 62
  case
    A2R10G10B10_SINT_PACK32 = 63
  case
    A2B10G10R10_UNORM_PACK32 = 64
  case
    A2B10G10R10_SNORM_PACK32 = 65
  case
    A2B10G10R10_USCALED_PACK32 = 66
  case
    A2B10G10R10_SSCALED_PACK32 = 67
  case
    A2B10G10R10_UINT_PACK32 = 68
  case
    A2B10G10R10_SINT_PACK32 = 69
  case
    R16_UNORM = 70
  case
    R16_SNORM = 71
  case
    R16_USCALED = 72
  case
    R16_SSCALED = 73
  case
    R16_UINT = 74
  case
    R16_SINT = 75
  case
    R16_SFLOAT = 76
  case
    R16G16_UNORM = 77
  case
    R16G16_SNORM = 78
  case
    R16G16_USCALED = 79
  case
    R16G16_SSCALED = 80
  case
    R16G16_UINT = 81
  case
    R16G16_SINT = 82
  case
    R16G16_SFLOAT = 83
  case
    R16G16B16_UNORM = 84
  case
    R16G16B16_SNORM = 85
  case
    R16G16B16_USCALED = 86
  case
    R16G16B16_SSCALED = 87
  case
    R16G16B16_UINT = 88
  case
    R16G16B16_SINT = 89
  case
    R16G16B16_SFLOAT = 90
  case
    R16G16B16A16_UNORM = 91
  case
    R16G16B16A16_SNORM = 92
  case
    R16G16B16A16_USCALED = 93
  case
    R16G16B16A16_SSCALED = 94
  case
    R16G16B16A16_UINT = 95
  case
    R16G16B16A16_SINT = 96
  case
    R16G16B16A16_SFLOAT = 97
  case
    R32_UINT = 98
  case
    R32_SINT = 99
  case
    R32_SFLOAT = 100
  case
    R32G32_UINT = 101
  case
    R32G32_SINT = 102
  case
    R32G32_SFLOAT = 103
  case
    R32G32B32_UINT = 104
  case
    R32G32B32_SINT = 105
  case
    R32G32B32_SFLOAT = 106
  case
    R32G32B32A32_UINT = 107
  case
    R32G32B32A32_SINT = 108
  case
    R32G32B32A32_SFLOAT = 109
  case
    R64_UINT = 110
  case
    R64_SINT = 111
  case
    R64_SFLOAT = 112
  case
    R64G64_UINT = 113
  case
    R64G64_SINT = 114
  case
    R64G64_SFLOAT = 115
  case
    R64G64B64_UINT = 116
  case
    R64G64B64_SINT = 117
  case
    R64G64B64_SFLOAT = 118
  case
    R64G64B64A64_UINT = 119
  case
    R64G64B64A64_SINT = 120
  case
    R64G64B64A64_SFLOAT = 121
  case
    B10G11R11_UFLOAT_PACK32 = 122
  case
    E5B9G9R9_UFLOAT_PACK32 = 123
  case
    D16_UNORM = 124
  case
    X8_D24_UNORM_PACK32 = 125
  case
    D32_SFLOAT = 126
  case
    S8_UINT = 127
  case
    D16_UNORM_S8_UINT = 128
  case
    D24_UNORM_S8_UINT = 129
  case
    D32_SFLOAT_S8_UINT = 130
  case
    BC1_RGB_UNORM_BLOCK = 131
  case
    BC1_RGB_SRGB_BLOCK = 132
  case
    BC1_RGBA_UNORM_BLOCK = 133
  case
    BC1_RGBA_SRGB_BLOCK = 134
  case
    BC2_UNORM_BLOCK = 135
  case
    BC2_SRGB_BLOCK = 136
  case
    BC3_UNORM_BLOCK = 137
  case
    BC3_SRGB_BLOCK = 138
  case
    BC4_UNORM_BLOCK = 139
  case
    BC4_SNORM_BLOCK = 140
  case
    BC5_UNORM_BLOCK = 141
  case
    BC5_SNORM_BLOCK = 142
  case
    BC6H_UFLOAT_BLOCK = 143
  case
    BC6H_SFLOAT_BLOCK = 144
  case
    BC7_UNORM_BLOCK = 145
  case
    BC7_SRGB_BLOCK = 146
  case
    ETC2_R8G8B8_UNORM_BLOCK = 147
  case
    ETC2_R8G8B8_SRGB_BLOCK = 148
  case
    ETC2_R8G8B8A1_UNORM_BLOCK = 149
  case
    ETC2_R8G8B8A1_SRGB_BLOCK = 150
  case
    ETC2_R8G8B8A8_UNORM_BLOCK = 151
  case
    ETC2_R8G8B8A8_SRGB_BLOCK = 152
  case
    EAC_R11_UNORM_BLOCK = 153
  case
    EAC_R11_SNORM_BLOCK = 154
  case
    EAC_R11G11_UNORM_BLOCK = 155
  case
    EAC_R11G11_SNORM_BLOCK = 156
  case
    ASTC_4x4_UNORM_BLOCK = 157
  case
    ASTC_4x4_SRGB_BLOCK = 158
  case
    ASTC_5x4_UNORM_BLOCK = 159
  case
    ASTC_5x4_SRGB_BLOCK = 160
  case
    ASTC_5x5_UNORM_BLOCK = 161
  case
    ASTC_5x5_SRGB_BLOCK = 162
  case
    ASTC_6x5_UNORM_BLOCK = 163
  case
    ASTC_6x5_SRGB_BLOCK = 164
  case
    ASTC_6x6_UNORM_BLOCK = 165
  case
    ASTC_6x6_SRGB_BLOCK = 166
  case
    ASTC_8x5_UNORM_BLOCK = 167
  case
    ASTC_8x5_SRGB_BLOCK = 168
  case
    ASTC_8x6_UNORM_BLOCK = 169
  case
    ASTC_8x6_SRGB_BLOCK = 170
  case
    ASTC_8x8_UNORM_BLOCK = 171
  case
    ASTC_8x8_SRGB_BLOCK = 172
  case
    ASTC_10x5_UNORM_BLOCK = 173
  case
    ASTC_10x5_SRGB_BLOCK = 174
  case
    ASTC_10x6_UNORM_BLOCK = 175
  case
    ASTC_10x6_SRGB_BLOCK = 176
  case
    ASTC_10x8_UNORM_BLOCK = 177
  case
    ASTC_10x8_SRGB_BLOCK = 178
  case
    ASTC_10x10_UNORM_BLOCK = 179
  case
    ASTC_10x10_SRGB_BLOCK = 180
  case
    ASTC_12x10_UNORM_BLOCK = 181
  case
    ASTC_12x10_SRGB_BLOCK = 182
  case
    ASTC_12x12_UNORM_BLOCK = 183
  case
    ASTC_12x12_SRGB_BLOCK = 184
  case
    G8B8G8R8_422_UNORM = 1_000_156_000
  case
    B8G8R8G8_422_UNORM = 1_000_156_001
  case
    G8_B8_R8_3PLANE_420_UNORM = 1_000_156_002
  case
    G8_B8R8_2PLANE_420_UNORM = 1_000_156_003
  case
    G8_B8_R8_3PLANE_422_UNORM = 1_000_156_004
  case
    G8_B8R8_2PLANE_422_UNORM = 1_000_156_005
  case
    G8_B8_R8_3PLANE_444_UNORM = 1_000_156_006
  case
    R10X6_UNORM_PACK16 = 1_000_156_007
  case
    R10X6G10X6_UNORM_2PACK16 = 1_000_156_008
  case
    R10X6G10X6B10X6A10X6_UNORM_4PACK16 = 1_000_156_009
  case
    G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = 1_000_156_010
  case
    B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = 1_000_156_011
  case
    G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = 1_000_156_012
  case
    G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = 1_000_156_013
  case
    G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = 1_000_156_014
  case
    G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = 1_000_156_015
  case
    G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = 1_000_156_016
  case
    R12X4_UNORM_PACK16 = 1_000_156_017
  case
    R12X4G12X4_UNORM_2PACK16 = 1_000_156_018
  case
    R12X4G12X4B12X4A12X4_UNORM_4PACK16 = 1_000_156_019
  case
    G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = 1_000_156_020
  case
    B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = 1_000_156_021
  case
    G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = 1_000_156_022
  case
    G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = 1_000_156_023
  case
    G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = 1_000_156_024
  case
    G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = 1_000_156_025
  case
    G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = 1_000_156_026
  case
    G16B16G16R16_422_UNORM = 1_000_156_027
  case
    B16G16R16G16_422_UNORM = 1_000_156_028
  case
    G16_B16_R16_3PLANE_420_UNORM = 1_000_156_029
  case
    G16_B16R16_2PLANE_420_UNORM = 1_000_156_030
  case
    G16_B16_R16_3PLANE_422_UNORM = 1_000_156_031
  case
    G16_B16R16_2PLANE_422_UNORM = 1_000_156_032
  case
    G16_B16_R16_3PLANE_444_UNORM = 1_000_156_033
  case
    PVRTC1_2BPP_UNORM_BLOCK_IMG = 1_000_054_000
  case
    PVRTC1_4BPP_UNORM_BLOCK_IMG = 1_000_054_001
  case
    PVRTC2_2BPP_UNORM_BLOCK_IMG = 1_000_054_002
  case
    PVRTC2_4BPP_UNORM_BLOCK_IMG = 1_000_054_003
  case
    PVRTC1_2BPP_SRGB_BLOCK_IMG = 1_000_054_004
  case
    PVRTC1_4BPP_SRGB_BLOCK_IMG = 1_000_054_005
  case
    PVRTC2_2BPP_SRGB_BLOCK_IMG = 1_000_054_006
  case
    PVRTC2_4BPP_SRGB_BLOCK_IMG = 1_000_054_007
  static let G8B8G8R8_422_UNORM_KHR = G8B8G8R8_422_UNORM
  static let B8G8R8G8_422_UNORM_KHR = B8G8R8G8_422_UNORM
  static let G8_B8_R8_3PLANE_420_UNORM_KHR = G8_B8_R8_3PLANE_420_UNORM
  static let G8_B8R8_2PLANE_420_UNORM_KHR = G8_B8R8_2PLANE_420_UNORM
  static let G8_B8_R8_3PLANE_422_UNORM_KHR = G8_B8_R8_3PLANE_422_UNORM
  static let G8_B8R8_2PLANE_422_UNORM_KHR = G8_B8R8_2PLANE_422_UNORM
  static let G8_B8_R8_3PLANE_444_UNORM_KHR = G8_B8_R8_3PLANE_444_UNORM
  static let R10X6_UNORM_PACK16_KHR = R10X6_UNORM_PACK16
  static let R10X6G10X6_UNORM_2PACK16_KHR = R10X6G10X6_UNORM_2PACK16
  static let R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR = R10X6G10X6B10X6A10X6_UNORM_4PACK16
  static let G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR = G10X6B10X6G10X6R10X6_422_UNORM_4PACK16
  static let B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR = B10X6G10X6R10X6G10X6_422_UNORM_4PACK16
  static let G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR =
    G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16
  static let G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR =
    G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16
  static let G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR =
    G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16
  static let G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR =
    G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16
  static let G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR =
    G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16
  static let R12X4_UNORM_PACK16_KHR = R12X4_UNORM_PACK16
  static let R12X4G12X4_UNORM_2PACK16_KHR = R12X4G12X4_UNORM_2PACK16
  static let R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR = R12X4G12X4B12X4A12X4_UNORM_4PACK16
  static let G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR = G12X4B12X4G12X4R12X4_422_UNORM_4PACK16
  static let B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR = B12X4G12X4R12X4G12X4_422_UNORM_4PACK16
  static let G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR =
    G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16
  static let G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR =
    G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16
  static let G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR =
    G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16
  static let G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR =
    G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16
  static let G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR =
    G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16
  static let G16B16G16R16_422_UNORM_KHR = G16B16G16R16_422_UNORM
  static let B16G16R16G16_422_UNORM_KHR = B16G16R16G16_422_UNORM
  static let G16_B16_R16_3PLANE_420_UNORM_KHR = G16_B16_R16_3PLANE_420_UNORM
  static let G16_B16R16_2PLANE_420_UNORM_KHR = G16_B16R16_2PLANE_420_UNORM
  static let G16_B16_R16_3PLANE_422_UNORM_KHR = G16_B16_R16_3PLANE_422_UNORM
  static let G16_B16R16_2PLANE_422_UNORM_KHR = G16_B16R16_2PLANE_422_UNORM
  static let G16_B16_R16_3PLANE_444_UNORM_KHR = G16_B16_R16_3PLANE_444_UNORM

  public var vulkan: VkFormat {
    VkFormat(self.rawValue)
  }
}
