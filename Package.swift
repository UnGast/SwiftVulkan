// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Vulkan",
    products: [
        .library(name: "Vulkan", targets: ["Vulkan"]),
        .executable(
            name: "Generator",
            targets: ["Generator"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/UnGast/CVulkan.git", .branch("master")),
        .package(url: "https://github.com/yahoojapan/SwiftyXMLParser.git", .branch("master")),
        .package(url: "https://github.com/sharplet/Regex.git", from: "2.1.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
    ],
    targets: [
        .target(
           name: "Generator",
           dependencies: ["SwiftyXMLParser", "Regex", .product(name: "ArgumentParser", package: "swift-argument-parser")],
           resources: [.process("Resources/vk.xml")]),
        .target(name: "Vulkan", dependencies: ["CVulkan"])
    ]
)
