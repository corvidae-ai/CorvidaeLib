// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CorvidaeLib",
    platforms: [
        .iOS(.v16) // iOS version target
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CorvidaeLib",
            targets: ["CorvidaeCore"]),
    ],
    targets: [
        // The destination of the framework you will obfuscate the code
        .binaryTarget(
            name: "CorvidaeCore",
            //path: "./Sources/CorvidaeCore.xcframework"
            url: "https://github.com/corvidae-ai/CorvidaeLib/releases/download/2.2.2/CorvidaeCore.xcframework.zip",
            checksum: "e161972df6c248e369838c451ebd4bead05cbb6eb512cd3b84a6d864a77880bc"
        ),
        
    ]
)
