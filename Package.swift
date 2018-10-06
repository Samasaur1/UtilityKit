// swift-tools-version:4.0
// Managed by ice

import PackageDescription

let package = Package(
    name: "UtilityKit",
    products: [
        .library(name: "UtilityKit", targets: ["UtilityKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Samasaur1/ProtocolKit.git", from: "1.0.2"),
    ],
    targets: [
        .target(name: "UtilityKit", dependencies: ["ProtocolKit"]),
        .testTarget(name: "UtilityKitTests", dependencies: ["UtilityKit"]),
    ]
)
