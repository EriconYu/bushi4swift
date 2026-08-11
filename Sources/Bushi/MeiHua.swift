// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import Foundation

public enum MeiHua {
    public static func shiJianQiGua(_ ctx: DivinationContext) -> PaipanResult {
        let yearZhi = String(ctx.ganZhi[0].dropFirst().prefix(1))
        let hourZhi = String(ctx.ganZhi[3].dropFirst().prefix(1))
        let yzNum = GuaData.getZhiIndex(yearZhi)
        let hzNum = GuaData.getZhiIndex(hourZhi)
        let sumYMD = yzNum + ctx.lunarMonth + ctx.lunarDay
        let sumYMDH = sumYMD + hzNum
        var shang = sumYMD % 8; if shang == 0 { shang = 8 }
        var xia = sumYMDH % 8; if xia == 0 { xia = 8 }
        let bianPos = LiuYao.movingLineIndex(sumYMDH)
        return LiuYao.buildResult(ctx, shangGua: shang, xiaGua: xia, bianPos: bianPos, method: "梅花时间起卦")
    }

    /// 数字起卦；第三个数字须为非负整数并按6取余决定动爻。
    public static func shuZiQiGua(_ ctx: DivinationContext, numbers: [Int]) -> PaipanResult {
        var shang = numbers[0] % 8; if shang == 0 { shang = 8 }
        var xia = numbers[1] % 8; if xia == 0 { xia = 8 }
        let bianPos = LiuYao.movingLineIndex(numbers[2])
        return LiuYao.buildResult(ctx, shangGua: shang, xiaGua: xia, bianPos: bianPos, method: "梅花数字起卦")
    }

    public static func suiJiQiGua(_ ctx: DivinationContext) -> PaipanResult {
        let n0 = Int.random(in: 1...8)
        let n1 = Int.random(in: 1...8)
        let n2 = Int.random(in: 1...6)
        return shuZiQiGua(ctx, numbers: [n0, n1, n2])
    }

    public static func shouYaoQiGua(_ ctx: DivinationContext, yaos: [Int]) -> PaipanResult {
        let shangYY = [GuaData.yaoToYinYang(yaos[2]), GuaData.yaoToYinYang(yaos[1]), GuaData.yaoToYinYang(yaos[0])]
        let xiaYY = [GuaData.yaoToYinYang(yaos[5]), GuaData.yaoToYinYang(yaos[4]), GuaData.yaoToYinYang(yaos[3])]
        let shangGua = GuaData.yaosToBaGuaNum(shangYY)
        let xiaGua = GuaData.yaosToBaGuaNum(xiaYY)
        let benGuaName = GuaData.guas64[shangGua-1][xiaGua-1]
        let benGua = GuaInfo(name: benGuaName, yaos: yaos)
        let huYaos = GuaCalc.getHuGuaYaos(yaos)
        let huGua = GuaInfo(name: GuaCalc.get64GuaNameByYaos(huYaos), yaos: huYaos)
        var bianPos = -1
        for i in 0..<6 {
            if yaos[i] == Yao.laoYang || yaos[i] == Yao.laoYin { bianPos = i; break }
        }
        let bianYaos = GuaCalc.getBianGuaYaos(yaos, pos: bianPos)
        let bianGua = GuaInfo(name: GuaCalc.get64GuaNameByYaos(bianYaos), yaos: bianYaos)
        return PaipanResult(method: "梅花手摇起卦", ganZhi: ctx.ganZhi, xunKong: ctx.xunKong,
            benGua: benGua, huGua: huGua, bianGua: bianGua, bianYao: bianPos,
            shangGua: GuaData.guaNumToName(shangGua), xiaGua: GuaData.guaNumToName(xiaGua),
            shangGuaWuXing: GuaData.guaNumToWuXing(shangGua), xiaGuaWuXing: GuaData.guaNumToWuXing(xiaGua),
            benGuaEx: nil, bianGuaEx: nil, liuShen: nil)
    }
}
