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
        .executable(
            name: "Generator",
            targets: ["Generator"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/UnGast/CSDL2.git", .branch("master")),
        .package(url: "https://github.com/mxcl/Path.swift.git", from: "1.0.0"),
        .package(url: "https://github.com/yahoojapan/SwiftyXMLParser.git", .branch("master")),
        .package(url: "https://github.com/sharplet/Regex.git", from: "2.1.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
        .package(name: "Swim", url: "https://github.com/t-ae/swim.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "swift-vulkan-test",
            dependencies: ["CSDL2", "CVulkan", "Vulkan", "CSDL2Vulkan", "Swim"],
            resources: [
                .copy("Resources")
            ]),
        .target(name: "Generator", dependencies: [.product(name: "Path", package: "Path.swift"), "SwiftyXMLParser", "Regex", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .systemLibrary(name: "CVulkan"),
        .systemLibrary(name: "CSDL2Vulkan"),
        .target(name: "Vulkan", dependencies: ["CVulkan"]),
        .testTarget(
            name: "swift-vulkan-testTests",
            dependencies: ["swift-vulkan-test"]),
    ]
)
