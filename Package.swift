// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Bushi",
    products: [
        .library(name: "Bushi", targets: ["Bushi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/6tail/lunar-swift.git", from: "1.0.0"),
    ],
    targets: [
       .target(
           name: "Bushi",
            dependencies: [.product(name: "LunarSwift", package: "lunar-swift")]
       ),
        .testTarget(
            name: "BushiTests",
            dependencies: ["Bushi"]
        ),
    ]
)
