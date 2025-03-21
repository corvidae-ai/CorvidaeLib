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
            url: "https://github.com/corvidae-ai/CorvidaeLib/releases/download/2.1.8/CorvidaeCore.xcframework.zip",
            checksum: "e52e4a358bfcf6e4309d944ce2ef53fac55497faa8756c4bd6367c8abe505b45"
        ),
        
    ]
)
