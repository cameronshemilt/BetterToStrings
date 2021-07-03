// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BetterToStrings",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "BetterToStrings",
            targets: ["BetterToStrings"]),
    ],
    targets: [
        .target(
            name: "BetterToStrings",
            dependencies: []),
        .testTarget(
            name: "BetterToStringsTests",
            dependencies: ["BetterToStrings"]),
    ]
)
