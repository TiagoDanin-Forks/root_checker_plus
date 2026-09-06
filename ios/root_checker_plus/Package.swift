// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// DTTJailbreakDetection is vendored instead of pulled from GitHub because Flutter's
// SwiftPM resolver fails with "the package manifest at '/Package.swift' cannot be
// accessed" against that repository. The vendored sources match upstream 0.4.0.
let package = Package(
    name: "root_checker_plus",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "root-checker-plus", targets: ["root_checker_plus"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "DTTJailbreakDetection",
            path: "Sources/DTTJailbreakDetection",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/DTTJailbreakDetection")
            ],
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "root_checker_plus",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "DTTJailbreakDetection"
            ]
        )
    ]
)
