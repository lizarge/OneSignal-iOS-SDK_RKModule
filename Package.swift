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
          checksum: "cf0d27b9a2a0523d8c73fd3cc8e61c0bba475697a5194020bc1699a1999fe062"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip",
          checksum: "fc66dd5a4d42c5b9ca53b2f44b702b9d51564c147bc0c4147665750aa3e320ea"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip",
          checksum: "fab79a4a613c2ef3f027faf67025c8e03dc2d06e05a52632a033e1fbee0e8033"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/master/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip",
          checksum: "ad9b89dec84db63c62c3ab6d3d16183f924cdd373ce476d28e5cd8643f8512b2"
        )
    ]
)


  