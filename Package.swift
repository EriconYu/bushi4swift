// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

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
            dependencies: [.product(name: "LunarSwift", package: "lunar-swift")],
            resources: [.copy("data/gua_texts.json")]
      ),
       .testTarget(
            name: "BushiTests",
            dependencies: ["Bushi"]
        ),
    ]
)

// ─────────────────────────────────────────────
// 不惑之心 卜筮引擎
// 官网：https://www.buhuo.xin
// 作者：净志
// 微信：haitaojingzhi
// ─────────────────────────────────────────────
