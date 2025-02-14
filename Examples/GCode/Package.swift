// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GCodeExample",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(path: "../.."),
    ],
    targets: [
        .executableTarget(
            name: "gcode-example",
            dependencies: [
                .product(name: "ZaberMotionLib", package: "swift"),
            ]
        ),
    ]
)
