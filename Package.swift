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
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.11/iOS_SDK/OneSignalSDK/OneSignal_XCFramework/OneSignal.xcframework.zip",
          checksum: "6fd0d3ca55ed67e40df514ef7cf2374cc613ca3488aa9ddf835223a63b96623f"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.11/iOS_SDK/OneSignalSDK/OneSignal_Extension/OneSignalExtension.xcframework.zip",
          checksum: "96679279355ba0418ccb542fd7b8be4857a3caac401a6c752bb24e355ea6f7ed"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.11/iOS_SDK/OneSignalSDK/OneSignal_Outcomes/OneSignalOutcomes.xcframework.zip",
          checksum: "96400eba9b10ab5f9edffa6fb1e30b44789dda65cdd5a52086432291ebcc6049"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/lizarge/OneSignal-iOS-SDK_RKModule/raw/1.11/iOS_SDK/OneSignalSDK/OneSignal_Core/OneSignalCore.xcframework.zip",
          checksum: "56486072f5edfa3abf3f9fc4f65de42999e1bf55964845f35177d07dea040faa"
        )
    ]
)