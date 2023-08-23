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
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_XCFramework/OneSignal.xcframework.zip",
          checksum: "db3ea4f95b72cb5808f991f9a6de82a7f4e0adae9b20435fd0c6b8853bd93f14"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip",
          checksum: "e9a4e2f1921944fc1e79fc51108d627659f44530f01fa5dc4ff72c555f09db77"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip",
          checksum: "dd8de9b6ebb6996dd7ee4ce6a33b6833b4ecd7677127b0c6ed1d6e0c38ac2179"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip",
          checksum: "9f131e9f3d87174276bb145c5c91fe01522a3d8b4a6fa94167e780f8a6c6801f"
        )
    ]
)


  