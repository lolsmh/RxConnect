// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxConnect",
    platforms: [.iOS(.v9), .tvOS(.v9)],
    products: [
        .library(name: "RxConnect", targets: ["RxConnect"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0")),
        .package(url: "https://github.com/RxSwiftCommunity/NSObject-Rx", .upToNextMajor(from: "5.2.2"))
    ],
    targets: [
        .target(name: "RxConnect", dependencies: [
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift"),
            .product(name: "NSObject-Rx", package: "NSObject-Rx")
        ]),
        .testTarget(name: "RxConnectTests", dependencies: ["RxConnect"]),
    ],
    swiftLanguageVersions: [.v5]
)
