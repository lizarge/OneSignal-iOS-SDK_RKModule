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
          url: "https://github.com/OneSignal/OneSignal-iOS-SDK/releases/download/1.0/OneSignal.xcframework.zip",
          checksum: "46aadfc0c765c477347563ebe7b87862bc8a680322419d5928fe84bd29e16875"
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip"
          url: "https://github.com/OneSignal/OneSignal-iOS-SDK/releases/download/1.0/OneSignalExtension.xcframework.zip",
          checksum: "2e8b2008d4083fe355b9cde2980a4f441bac883a6fc2b46e12525c6639b7614c"
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip"
        ),
          url: "https://github.com/OneSignal/OneSignal-iOS-SDK/releases/download/1.0/OneSignalOutcomes.xcframework.zip",
          checksum: "a82c6bad792eabb95b38ad22b0b8fcf464426f5f6be1386e65c0b675dc90f0f9"
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/main/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip"
        )
    ]
          url: "https://github.com/OneSignal/OneSignal-iOS-SDK/releases/download/1.0/OneSignalCore.xcframework.zip",
