# bushi4swift

卜筮 — Swift 六爻 / 梅花易数排盘引擎，基于 [lunar-swift](https://github.com/6tail/lunar-swift)。

## 功能

- 64卦排盘（本卦、互卦、变卦）
- 六爻装卦（纳甲、六亲、世应、伏藏、六神）
- 梅花易数起卦（时间 / 数字 / 随机 / 手摇）
- 六爻起卦（时间 / 数字 / 随机 / 手摇）
- 基于 [lunar-swift](https://github.com/6tail/lunar-swift) 提供干支、旬空、农历月日
- 晚子时自动换日（23:00~00:00 归入次日子时）
- 内置 64 卦卦爻辞与解卦静态文本（见下方开源说明）

## 安装

在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/EriconYu/bushi4swift.git", from: "0.1.0"),
],
targets: [
    .target(name: "YourApp", dependencies: ["Bushi"]),
]
```

## 快速上手

```swift
import Bushi

let ctx = buildContext(Date())

// 六爻时间起卦
let r = LiuYao.shiJianQiGua(ctx)
print(r.benGua.name)       // 本卦名
print(r.bianGua?.name ?? "") // 变卦名
print(r.benGuaEx?.liuQin ?? "") // 六亲

// 梅花时间起卦
let mh = MeiHua.shiJianQiGua(ctx)
print(mh.benGua.name)

// 卦爻辞与解卦
if let texts = GuaTextsLoader.getGuaTexts("乾为天") {
    print(texts.yaoCi) // 卦辞 + 爻辞
    print(texts.jieXi) // 解卦解析
}
```

## 起卦方式

| 方式 | 六爻 | 梅花 |
|------|------|------|
| 时间起卦 | `LiuYao.shiJianQiGua` | `MeiHua.shiJianQiGua` |
| 数字起卦 | `LiuYao.shuZiQiGua` | `MeiHua.shuZiQiGua` |
| 随机起卦 | `LiuYao.suiJiQiGua` | `MeiHua.suiJiQiGua` |
| 手摇起卦 | `LiuYao.shouYaoQiGua` | `MeiHua.shouYaoQiGua` |

## 排盘结果

`PaipanResult` 包含：

- `benGua` / `huGua` / `bianGua`：本卦、互卦、变卦（卦名 + 六爻阴阳）
- `benGuaEx` / `bianGuaEx`：纳甲装卦（地支干支、六亲、世应、伏藏、卦身、八宫、五行、类型）
- `liuShen`：六神（根据日干排列）
- `ganZhi`：四柱干支、`xunKong`：旬空
- `bianYao`：动爻位置

## 卦爻辞与解卦

```swift
if let texts = GuaTextsLoader.getGuaTexts("乾为天") {
    print(texts.yaoCi) // 卦辞 + 爻辞
    print(texts.jieXi) // 解卦解析
}
```

## 多语言版本

bushi（卜筮）同时提供以下语言版本：

- **Dart**：[bushi4dart](https://github.com/EriconYu/bushi4dart)
- **Go**：[bushi4go](https://github.com/EriconYu/bushi4go)
- **Java**：[bushi4java](https://github.com/EriconYu/bushi4java)
- **Python**：[bushi4python](https://github.com/EriconYu/bushi4python)
- **TypeScript**：[bushi4ts](https://github.com/EriconYu/bushi4ts)
- **Swift**：[bushi4swift](https://github.com/EriconYu/bushi4swift)
- **Kotlin**：[bushi4kotlin](https://github.com/EriconYu/bushi4kotlin)

---

## 关于不惑之心

**不惑之心** — 传统文化与命理工具品牌

- **官网**：[https://www.buhuo.xin](https://www.buhuo.xin)
- **作者**：净志
- **微信**：haitaojingzhi

## 开源说明

- 排盘算法（六爻、梅花易数、64 卦）以 **MIT** 许可证开源。
- `Sources/Bushi/data/gua_texts.json` 内附 64 卦卦爻辞、解卦等静态文本，
  其版权归 **不惑之心** 所有，随库附带方便调用，但 **不以 MIT 开源**，
  不得用于另行出版、售卖或二次分发。
- 诸葛神算、观音灵签、81 数理等解读服务，请访问 [不惑之心](https://www.buhuo.xin)。

## 许可证

MIT

Copyright (c) 2026 不惑之心
