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
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_XCFramework/OneSignal.xcframework.zip"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip"
        )
    ]
)
