import CVulkan

public enum PipelineBindPoint: UInt32 {
    case graphics = 0,
         compute = 1,
         pointRayTracing = 2

    var vulkan: VkPipelineBindPoint {
        return VkPipelineBindPoint(self.rawValue)
    }
}

