// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MicroscopeExample",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(path: "../.."),
    ],
    targets: [
        .executableTarget(
            name: "microscope-example",
            dependencies: [
                .product(name: "ZaberMotionLib", package: "swift"),
            ]
        ),
    ]
)
