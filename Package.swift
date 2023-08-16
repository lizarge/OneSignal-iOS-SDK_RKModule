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
          checksum: "702fb354a0d99620ee346a8709108b3ffe2eeb0da04bcec5d74df84e488abaec"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip",
          checksum: "e2d52ed45abf76438e44c7ca85a35ce617bfcb7711d5644e00a5ee6ea6ec51a6"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip",
          checksum: "9e82594e047e9605ae5397dbe6dc12ec216b9802a779666d6cccfc7dfe63e87b"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip",
          checksum: "0d7bda457169b192385a6205dc1c7e9e50de9dcd012acca204b31fb8829a1b40"
        )
    ]
)


  