// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "root_checker_plus",
  platforms: [
    .iOS("13.0")
  ],
  products: [
    .library(name: "root-checker-plus", targets: ["root_checker_plus"])
  ],
  dependencies: [
    // DTTJailbreakDetection only gained a Package.swift after its last release
    // tag (0.4.0), so it has to be pinned to a specific master revision rather
    // than a semantic version. The CocoaPods path in root_checker_plus.podspec
    // still resolves the tagged 0.4.0 release.
    .package(
      url: "https://github.com/thii/DTTJailbreakDetection.git",
      revision: "cedd42473963615bd147c74e04346a2fd7f0d9b4"
    )
  ],
  targets: [
    .target(
      name: "root_checker_plus",
      dependencies: [
        .product(name: "DTTJailbreakDetection", package: "DTTJailbreakDetection")
      ]
    )
  ]
)
