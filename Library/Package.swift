// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Library",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Library",
            targets: ["Model", "Toolbox", "ViewToolbox"]
        ),
    ],
    targets: [
        .target(
            name: "Model",
            dependencies: ["Toolbox"]
        ),
        .target(
            name: "Toolbox",
            dependencies: []
        ),
        .target(
            name: "ViewToolbox",
            dependencies: ["Toolbox"]
        ),
    ]
)
