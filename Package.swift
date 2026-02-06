// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FHKObservability",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "FHKObservability",
            targets: ["FHKObservability"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "12.6.0"))
    ],
    targets: [
        .target(
            name: "FHKObservability",
            dependencies: [
                // Modules Firebase
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FHKObservabilityTests",
            dependencies: ["FHKObservability"]
        ),
    ]
)
