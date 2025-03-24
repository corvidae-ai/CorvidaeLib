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
            url: "https://github.com/corvidae-ai/CorvidaeLib/releases/download/2.2.3/CorvidaeCore.xcframework.zip",
            checksum: "12a165fd8b23aeb92c5f1dccafd5d41d18f3d28926965d9567d3b2bf59884df5"
        ),
        
    ]
)
