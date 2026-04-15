// swift-tools-version: 6.0

import PackageDescription

#if os(Linux)
#warning("Events are not supported on Linux due to the absence of the Combine framework.")
#elseif os(Windows)
#warning("Events are not supported on Windows due to the absence of the Combine framework.")
#endif

#if os(macOS)
let coreTarget: Target = .binaryTarget(
    name: "ZaberMotionCore",
    url: "https://software.zaber.com/downloads/ZML/Swift/9.1.0/ZaberMotionCore.xcframework.zip",
        checksum: "9a1c1ca3860f98c0fca7eeebe1c9946a2d8cc5b9a63097450698b315fd824aac"
)
#else
let coreTarget: Target = .systemLibrary(
    name: "ZaberMotionCore",
    path: "ZaberMotionCore/Headers"
)
#endif

#if os(Windows)
let bsonDependencies: [Package.Dependency] = []
let bsonTargetDependency: [Target.Dependency] = []
#else
let bsonDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/mongodb/swift-bson", .upToNextMajor(from: "3.1.0"))
]
let bsonTargetDependency: [Target.Dependency] = [
    .product(name: "SwiftBSON", package: "swift-bson")
]
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
    dependencies: bsonDependencies,
    targets: [
        coreTarget,
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
                "ZaberMotion",
                "ZaberMotionAscii",
                "ZaberMotionBinary",
                "ZaberMotionExceptions",
                "ZaberMotionMicroscopy",
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
            dependencies: ["Utils"],
            path: "Sources/ZaberMotion/Dto/Serializable"
        ),
        .target(
            name: "DtoAscii",
            dependencies: [
                "DtoSerializable",
                "Dto",
                "UnitsInternal"
            ],
            path: "Sources/ZaberMotion/Dto/Ascii"
        ),
        .target(
            name: "DtoBinary",
            dependencies: [
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Binary"
        ),
        .target(
            name: "DtoExceptions",
            dependencies: [
                "DtoSerializable",
                "Dto",
            ],
            path: "Sources/ZaberMotion/Dto/Exceptions"
        ),
        .target(
            name: "DtoGcode",
            dependencies: [
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Gcode"
        ),
        .target(
            name: "DtoMicroscopy",
            dependencies: [
                "DtoSerializable",
                "Dto"
            ],
            path: "Sources/ZaberMotion/Dto/Microscopy"
        ),
        .target(
            name: "DtoProduct",
            dependencies: [
                "DtoSerializable"
            ],
            path: "Sources/ZaberMotion/Dto/Product"
        ),
        .target(
            name: "DtoRequests",
            dependencies: [
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
            dependencies: bsonTargetDependency,
            path: "Sources/ZaberMotion/Utils"
        )
    ]
)
