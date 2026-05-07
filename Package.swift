// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "Xerces-S",
  platforms: [.macOS(.v26),.visionOS(.v1),.iOS(.v16),.tvOS(.v16)],
  products: [
    .library(
      name: "Xerces-S",
      targets: ["Xerces-S"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/bastie/JavApi4Swift.git",
      .upToNextMajor(from: "0.29.0")
    )
  ],
  targets: [
    .target(
      name: "Xerces-S",
      dependencies: [
        .product(name: "JavApi", package: "JavApi4Swift")
      ]
    ),
    .testTarget(
      name: "Xerces-STests",
      dependencies: ["Xerces-S"],
      path: "TestsS",
    ),
  ]
)

