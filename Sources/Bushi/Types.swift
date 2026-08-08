// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import Foundation

/// 爻值常量。所有六爻数组均为 `index 0 = 上爻（六爻）`、`index 5 = 初爻`。
public enum Yao {
    public static let shaoYang = 1
    public static let shaoYin = 2
    public static let laoYang = 3
    public static let laoYin = 4
}

public struct FuCang {
    /// 1-based 画卦位置：1=上爻（六爻），6=初爻。
    public let pos: Int
    public let value: String
    public init(pos: Int, value: String) { self.pos = pos; self.value = value }
}

public struct GuaExData {
    public let name: String
    /// 六亲 6 字，顺序为上爻到初爻。
    public let liuQin: String
    /// 每爻干支 6 项，顺序为上爻到初爻。
    public let ganZhi: [String]
    /// 1-based：1=上爻（六爻），6=初爻。
    public let shi: Int
    /// 1-based：1=上爻（六爻），6=初爻。
    public let ying: Int
    public let fuCang: [FuCang]
    public let guaShen: Int
    public let baGong: String
    public let wuXing: String
    public let kind: String

    public init(name: String, liuQin: String, ganZhi: [String], shi: Int, ying: Int,
                fuCang: [FuCang], guaShen: Int, baGong: String, wuXing: String, kind: String) {
        self.name = name; self.liuQin = liuQin; self.ganZhi = ganZhi
        self.shi = shi; self.ying = ying; self.fuCang = fuCang
        self.guaShen = guaShen; self.baGong = baGong; self.wuXing = wuXing; self.kind = kind
    }
}

public struct GuaInfo {
    public let name: String
    /// 爻值数组：index 0=上爻（六爻），index 5=初爻。
    public let yaos: [Int]
    public init(name: String, yaos: [Int]) { self.name = name; self.yaos = yaos }
}

public struct DivinationContext {
    public let ganZhi: [String]
    public let xunKong: String
    public let lunarMonth: Int
    public let lunarDay: Int
    public init(ganZhi: [String], xunKong: String, lunarMonth: Int, lunarDay: Int) {
        self.ganZhi = ganZhi; self.xunKong = xunKong
        self.lunarMonth = lunarMonth; self.lunarDay = lunarDay
    }
}

public struct PaipanResult {
    public let method: String
    public let ganZhi: [String]
    public let xunKong: String
    public let benGua: GuaInfo
    public let huGua: GuaInfo
    public let bianGua: GuaInfo?
    /// 首个动爻的数组索引：0=上爻，5=初爻，-1=无动爻。
    /// 手摇多动爻应同时检查 `benGua.yaos` 中所有值为 3/4 的元素。
    public let bianYao: Int
    public let shangGua: String
    public let xiaGua: String
    public let shangGuaWuXing: String
    public let xiaGuaWuXing: String
    public let benGuaEx: GuaExData?
    public let bianGuaEx: GuaExData?
    /// 六神 6 项，顺序为上爻到初爻。
    public let liuShen: [String]?

    public init(method: String, ganZhi: [String], xunKong: String, benGua: GuaInfo, huGua: GuaInfo,
                bianGua: GuaInfo?, bianYao: Int, shangGua: String, xiaGua: String,
                shangGuaWuXing: String, xiaGuaWuXing: String,
                benGuaEx: GuaExData?, bianGuaEx: GuaExData?, liuShen: [String]?) {
        self.method = method; self.ganZhi = ganZhi; self.xunKong = xunKong
        self.benGua = benGua; self.huGua = huGua; self.bianGua = bianGua
        self.bianYao = bianYao; self.shangGua = shangGua; self.xiaGua = xiaGua
        self.shangGuaWuXing = shangGuaWuXing; self.xiaGuaWuXing = xiaGuaWuXing
        self.benGuaEx = benGuaEx; self.bianGuaEx = bianGuaEx; self.liuShen = liuShen
    }
}
