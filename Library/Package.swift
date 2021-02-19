// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Library",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Library",
            targets: ["Model"]
        ),
    ],
    targets: [
        .target(
            name: "Model",
            dependencies: []
        ),
    ]
)
