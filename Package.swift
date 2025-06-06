// swift-tools-version: 6.0

import PackageDescription

#if os(macOS)
    let zaberMotionCoreTarget: Target = .binaryTarget(
        name: "ZaberMotionCore",
        url: "https://software.zaber.com/downloads/ZML/Swift/7.8.4/ZaberMotionCore.xcframework.zip",
        checksum: "11d6e4bf5f95ff5aa2d4b45961d68f5d5eb66aa5eca032e52ba698a18a4b1290"
    )
#else
    fatalError("Unsupported OS")
#endif

let package = Package(
    name: "ZaberMotionLib",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "ZaberMotionLib",
            targets: [
                "ZaberMotion",
                "ZaberMotionAscii",
                "ZaberMotionBinary",
                "ZaberMotionExceptions",
                "ZaberMotionGcode",
                "ZaberMotionMicroscopy",
                "ZaberMotionProduct",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/mongodb/swift-bson", .upToNextMajor(from: "3.1.0"))
    ],
    targets: [
        zaberMotionCoreTarget,
        .target(
            name: "ZaberMotion",
            dependencies: [
                "Gateway",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion",
            exclude: [
                "Gateway",
                "Dto",
                "Ascii",
                "Binary",
                "Exceptions",
                "Gcode",
                "Microscopy",
                "Product",
                "Units",
                "Utils",
            ]
        ),
        .target(
            name: "Gateway",
            dependencies: [
                "ZaberMotionCore",
                "ZaberMotionExceptions",
            ],
            path: "Sources/ZaberMotion/Gateway"
        ),
        .testTarget(
            name: "ZaberMotionTests",
            dependencies: [
                "Gateway",
                "DtoRequests",
                "DtoSerializable",
                "ZaberMotionAscii",
                "ZaberMotionBinary",
                "ZaberMotionExceptions"
            ]
        ),
        .target(
            name: "ZaberMotionAscii",
            dependencies: [
                "DtoAscii",
                "Gateway",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion/Ascii"
        ),
        .target(
            name: "ZaberMotionBinary",
            dependencies: [
                "DtoBinary",
                "Gateway",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion/Binary"
        ),
        .target(
            name: "ZaberMotionExceptions",
            dependencies: [
                "DtoExceptions",
                "DtoRequests"
            ],
            path: "Sources/ZaberMotion/Exceptions"
        ),
        .target(
            name: "ZaberMotionGcode",
            dependencies: [
                "DtoGcode",
                "Gateway",
                "ZaberMotionAscii",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion/Gcode"
        ),
        .target(
            name: "ZaberMotionMicroscopy",
            dependencies: [
                "DtoMicroscopy",
                "Gateway",
                "ZaberMotionAscii",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion/Microscopy"
        ),
        .target(
            name: "ZaberMotionProduct",
            dependencies: [
                "DtoProduct",
                "Gateway",
                "ZaberMotionAscii",
                "ZaberMotionExceptions",
                "UnitsInternal",
                "Utils",
            ],
            path: "Sources/ZaberMotion/Product"
        ),
        .target(
            name: "UnitsInternal",
            path: "Sources/ZaberMotion/Units"
        ),
        .target(
            name: "Dto",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "UnitsInternal"
            ],
            path: "Sources/ZaberMotion/Dto",
            exclude: [
                "Ascii",
                "Binary",
                "Exceptions",
                "Gcode",
                "Microscopy",
                "Product",
                "Requests",
                "Serializable"
            ]
        ),
        .target(
            name: "DtoSerializable",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson")
            ],
            path: "Sources/ZaberMotion/Dto/Serializable"
        ),
        .target(
            name: "DtoAscii",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "Dto",
                "UnitsInternal"
            ],
            path: "Sources/ZaberMotion/Dto/Ascii"
        ),
        .target(
            name: "DtoBinary",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Binary"
        ),
        .target(
            name: "DtoExceptions",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
            ],
            path: "Sources/ZaberMotion/Dto/Exceptions"
        ),
        .target(
            name: "DtoGcode",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Gcode"
        ),
        .target(
            name: "DtoMicroscopy",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Microscopy"
        ),
        .target(
            name: "DtoProduct",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable"
            ],
            path: "Sources/ZaberMotion/Dto/Product"
        ),
        .target(
            name: "DtoRequests",
            dependencies: [
                .product(name: "SwiftBSON", package: "swift-bson"),
                "DtoSerializable",
                "Dto",
                "DtoAscii",
                "DtoBinary",
                "DtoMicroscopy",
                "DtoProduct",
                "DtoGcode",
                "UnitsInternal"
            ],
            path: "Sources/ZaberMotion/Dto/Requests"
        ),
        .target(
            name: "Utils",
            path: "Sources/ZaberMotion/Utils"
        )
    ]
)
