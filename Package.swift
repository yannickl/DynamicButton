// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "DynamicButton",
  products: [
    .library(name: "DynamicButton", targets: ["DynamicButton"]),
  ],
  targets: [
    .target(
      name: "DynamicButton",
      dependencies: [],
      path: "Sources"),
  ]
)
