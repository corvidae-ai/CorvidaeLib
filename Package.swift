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
            url: "https://github.com/corvidae-ai/CorvidaeLib/releases/download/2.2.0/CorvidaeCore.xcframework.zip",
            checksum: "6a4a97e74b64bf323f0451deb393e901f2bd2c72c89f92e6254de5581c4ed8ca"
        ),
        
    ]
)
