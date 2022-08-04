// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIWeeklyLayoutChallenge",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftUIWeeklyLayoutChallenge",
            targets: ["SwiftUIWeeklyLayoutChallenge"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUIWeeklyLayoutChallenge",
            dependencies: []),
    ]
)
