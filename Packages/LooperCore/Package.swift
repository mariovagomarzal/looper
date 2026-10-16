// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "LooperCore",
    platforms: [.macOS(.v15)],
    products: [
        .library(name: "LooperCore", targets: ["LooperCore"]),
    ],
    targets: [
        .target(name: "LooperCore"),
        .testTarget(name: "LooperCoreTests", dependencies: ["LooperCore"]),
    ]
)
