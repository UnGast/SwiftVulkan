import CSDL2
import CVulkan
import Vulkan

// SPRIV Compiler? https://github.com/stuartcarnie/SwiftSPIRV-Cross

SDL_Init(SDL_INIT_VIDEO)

let window = SDL_CreateWindow(
    "swift-vulkan-test",
    Int32(SDL_WINDOWPOS_CENTERED_MASK), Int32(SDL_WINDOWPOS_CENTERED_MASK),
    800, 600,
    SDL_WINDOW_SHOWN.rawValue | SDL_WINDOW_VULKAN.rawValue
)
/*
var appInfo = VulkanStruct(VkApplicationInfo())
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO
    appInfo.pNext = nil
    appInfo.pApplicationName = "wow"

var createInfo = VulkanStruct(VkInstanceCreateInfo())
createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
/*withUnsafePointer(to: appInfo) {
    createInfo.pNext = UnsafeRawPointer($0)
}*/
print("CREATE INFO", createInfo)*/


SDL_Delay(2000)