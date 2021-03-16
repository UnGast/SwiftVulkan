#version 450
#extension GL_ARB_separate_shader_objects:enable

vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),
    vec2(0.5, 0.5),
    vec2(-0.5, 0.5)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location=0) in vec3 inPosition;
layout(location=1) in vec3 inColor;
layout(location=2) in vec2 inTexCoord;

layout(location=0) out vec3 fragColor;
layout(location=1) out vec2 fragTexCoord;

void main() {
  vec4 tmp_position = ubo.proj * ubo.view * ubo.model * vec4(inPosition.xy /* + vec2(ubo.proj[2][3], 0)*/, inPosition.z, 1.);
  gl_Position = tmp_position;
  fragColor = inColor;
  fragTexCoord = inTexCoord;
}