// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OneSignal",
    products: [
        .library(
            name: "OneSignal",
            targets: ["OneSignalWrapper"]),
        .library(
            name: "OneSignalExtension",
            targets: ["OneSignalExtensionWrapper"])
    ],
    targets: [
        .target(
            name: "OneSignalWrapper",
            dependencies: [
                "OneSignal",
                "OneSignalExtension",
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalWrapper"
        ),
        .target(
            name: "OneSignalExtensionWrapper",
            dependencies: [
                "OneSignalExtension",
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalExtensionWrapper"
        ),
        .target(
            name: "OneSignalOutcomesWrapper",
            dependencies: [
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalOutcomesWrapper"
        ),
        .binaryTarget(
          name: "OneSignal",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.1/iOS_SDK/OneSignalSDK/OneSignal_XCFramework/OneSignal.xcframework.zip",
          checksum: "48668b7ff21c86f69aa20b1ab23004f3eb6ae77d9364ab6f95c5028df9a96aad"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.1/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip",
          checksum: "33c755097446caa05b6c97af5a013d29341b46299f45ef1fcc208b60b1e2adb6"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.1/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip",
          checksum: "d3e23f0675b7712712d93dd618b20b5d83afa460442a98c846b4d3c43b55f835"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.1/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip",
          checksum: "9cbb0079a555ba907895faca395a78943090474bac6089ae936ec3357c8071ec"
        )
    ]
)
