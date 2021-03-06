// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-vulkan-test",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(
            name: "swift-vulkan-test",
            targets: ["swift-vulkan-test"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/UnGast/CSDL2.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "swift-vulkan-test",
            dependencies: ["CSDL2", "CVulkan", "Vulkan", "CSDL2Vulkan"],
            resources: [
                .copy("Resources")
            ]),
        .systemLibrary(name: "CVulkan"),
        .systemLibrary(name: "CSDL2Vulkan"),
        .target(name: "Vulkan", dependencies: ["CVulkan"]),
        .testTarget(
            name: "swift-vulkan-testTests",
            dependencies: ["swift-vulkan-test"]),
    ]
)
