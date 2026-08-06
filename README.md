# bushi4swift

卜筮 — Swift 六爻/梅花易数排盘引擎，基于 lunar-swift。

## 功能

- 64卦排盘（本卦、互卦、变卦）
- 六爻装卦（纳甲、六亲、世应、伏藏、六神）
- 梅花易数起卦（时间 / 数字 / 随机 / 手摇）
- 六爻起卦（时间 / 数字 / 随机 / 手摇）
- 晚子时自动换日（23:00~00:00 归入次日子时）

## 快速上手

```swift
import Bushi

let ctx = buildContext(Date())
let result = LiuYao.shiJianQiGua(ctx)
print(result.benGua.name)   // 本卦名
print(result.bianGua?.name) // 变卦名
```

## 开源说明

本库仅开源排盘算法，不包含卦爻辞、解卦、诸葛神算等内容。

## 许可证

MIT
