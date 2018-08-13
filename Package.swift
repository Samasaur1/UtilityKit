// swift-tools-version:4.0
// Managed by ice

import PackageDescription

let package = Package(
    name: "UtilityKit",
    products: [
        .library(name: "UtilityKit", targets: ["UtilityKit"]),
    ],
    targets: [
        .target(name: "UtilityKit", dependencies: []),
        .testTarget(name: "UtilityKitTests", dependencies: ["UtilityKit"]),
    ]
)
