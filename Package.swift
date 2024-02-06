// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ATProtoKit",
    platforms: [
        .macOS(.v14), 
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "ATProtoKit",
            targets: ["ATProtoKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/michaeleisel/ZippyJSON.git", from: "1.0.10"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ATProtoKit",
            dependencies: [
                "ZippyJSON"
            ],
            path: "ATProtoKit/Sources"
        ),
    ]
)
