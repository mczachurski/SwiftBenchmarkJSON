// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Benchmark",
    dependencies: [
        .package(url: "https://github.com/postmates/PMJSON.git", from: "3.1.2")
    ],
    targets: [
        .target(name: "Benchmark", dependencies: ["PMJSON"]),
    ]
)
