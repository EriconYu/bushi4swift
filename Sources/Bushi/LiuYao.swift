// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import Foundation

public enum LiuYao {
    /// 将传统爻位转换为数组索引（0=上爻，5=初爻）；0及6的倍数为上爻，其他值按6取余。
    public static func movingLineIndex(_ yaoNumber: Int) -> Int {
        let normalized = ((yaoNumber - 1) % 6 + 6) % 6 + 1
        return 6 - normalized
    }

    /// 构建完整六爻排盘；`bianPos` 使用 0=上爻、5=初爻、-1=无动爻。
    public static func buildResult(_ ctx: DivinationContext, shangGua: Int, xiaGua: Int, bianPos: Int, method: String) -> PaipanResult {
        let shang = GuaData.baGuaNumToYaos(shangGua)
        let xia = GuaData.baGuaNumToYaos(xiaGua)
        var benYaos = [shang[2], shang[1], shang[0], xia[2], xia[1], xia[0]]
        if bianPos >= 0 && bianPos < 6 { benYaos[bianPos] += 2 }

        let benGuaName = GuaData.guas64[shangGua-1][xiaGua-1]
        let benGua = GuaInfo(name: benGuaName, yaos: benYaos)

        let huYaos = GuaCalc.getHuGuaYaos(benYaos)
        let huGua = GuaInfo(name: GuaCalc.get64GuaNameByYaos(huYaos), yaos: huYaos)

        let bianYaos = GuaCalc.getBianGuaYaos(benYaos, pos: bianPos)
        let bianGuaName = GuaCalc.get64GuaNameByYaos(bianYaos)
        let bianGua = GuaInfo(name: bianGuaName, yaos: bianYaos)

        let benGuaEx = GuaExDataMap.getGuaEx(benGuaName)
        let bianGuaExRaw = GuaExDataMap.getGuaEx(bianGuaName)

        var finalBianEx: GuaExData? = nil
        if let bgEx = benGuaEx, let bgExRaw = bianGuaExRaw {
            let blq = GuaExDataMap.reloadLiuQin(bgEx.wuXing, bgExRaw.ganZhi)
            finalBianEx = GuaExData(name: bgExRaw.name, liuQin: blq.joined(),
                ganZhi: bgExRaw.ganZhi, shi: bgExRaw.shi, ying: bgExRaw.ying,
                fuCang: bgExRaw.fuCang, guaShen: bgExRaw.guaShen,
                baGong: bgExRaw.baGong, wuXing: bgExRaw.wuXing, kind: bgExRaw.kind)
        }

        var liuShen: [String]? = nil
        if ctx.ganZhi[2].count >= 1 {
            let dayGan = String(ctx.ganZhi[2].prefix(1))
            liuShen = GuaExDataMap.getLiuShen(dayGan)
        }

        return PaipanResult(method: method, ganZhi: ctx.ganZhi, xunKong: ctx.xunKong,
            benGua: benGua, huGua: huGua, bianGua: bianGua, bianYao: bianPos,
            shangGua: GuaData.guaNumToName(shangGua), xiaGua: GuaData.guaNumToName(xiaGua),
            shangGuaWuXing: GuaData.guaNumToWuXing(shangGua), xiaGuaWuXing: GuaData.guaNumToWuXing(xiaGua),
            benGuaEx: benGuaEx, bianGuaEx: finalBianEx, liuShen: liuShen)
    }

    public static func shiJianQiGua(_ ctx: DivinationContext) -> PaipanResult {
        let yearZhi = String(ctx.ganZhi[0].dropFirst().prefix(1))
        let hourZhi = String(ctx.ganZhi[3].dropFirst().prefix(1))
        let yzNum = GuaData.getZhiIndex(yearZhi)
        let hzNum = GuaData.getZhiIndex(hourZhi)
        let sumYMD = yzNum + ctx.lunarMonth + ctx.lunarDay
        let sumYMDH = sumYMD + hzNum
        var shang = sumYMD % 8; if shang == 0 { shang = 8 }
        var xia = sumYMDH % 8; if xia == 0 { xia = 8 }
        let bianPos = movingLineIndex(sumYMDH)
        return buildResult(ctx, shangGua: shang, xiaGua: xia, bianPos: bianPos, method: "六爻时间起卦")
    }

    /// 数字起卦；第三个数字须为非负整数并按6取余决定动爻。
    public static func shuZiQiGua(_ ctx: DivinationContext, numbers: [Int]) -> PaipanResult {
        var shang = numbers[0] % 8; if shang == 0 { shang = 8 }
        var xia = numbers[1] % 8; if xia == 0 { xia = 8 }
        let bianPos = movingLineIndex(numbers[2])
        return buildResult(ctx, shangGua: shang, xiaGua: xia, bianPos: bianPos, method: "六爻数字起卦")
    }

    public static func suiJiQiGua(_ ctx: DivinationContext) -> PaipanResult {
        let n0 = Int.random(in: 1...8)
        let n1 = Int.random(in: 1...8)
        let n2 = Int.random(in: 1...6)
        return shuZiQiGua(ctx, numbers: [n0, n1, n2])
    }

    /// 手摇起卦。`yaos` 必须按上爻到初爻传入。
    ///
    /// 铜钱记录若按初爻到上爻产生，调用前执行 `Array(records.reversed())`；
    /// 返回数组可直接从索引 0 向下渲染，不要再次反转。
    public static func shouYaoQiGua(_ ctx: DivinationContext, yaos: [Int]) -> PaipanResult {
        let shangYY = [GuaData.yaoToYinYang(yaos[2]), GuaData.yaoToYinYang(yaos[1]), GuaData.yaoToYinYang(yaos[0])]
        let xiaYY = [GuaData.yaoToYinYang(yaos[5]), GuaData.yaoToYinYang(yaos[4]), GuaData.yaoToYinYang(yaos[3])]
        let shangGua = GuaData.yaosToBaGuaNum(shangYY)
        let xiaGua = GuaData.yaosToBaGuaNum(xiaYY)

        let benGuaName = GuaData.guas64[shangGua-1][xiaGua-1]
        let benGua = GuaInfo(name: benGuaName, yaos: yaos)

        let huYaos = GuaCalc.getHuGuaYaos(yaos)
        let huGua = GuaInfo(name: GuaCalc.get64GuaNameByYaos(huYaos), yaos: huYaos)

        let bianYaos = GuaCalc.getBianGuaYaos(yaos, pos: -1)
        let bianGua = GuaInfo(name: GuaCalc.get64GuaNameByYaos(bianYaos), yaos: bianYaos)

        let benGuaEx = GuaExDataMap.getGuaEx(benGuaName)
        let bianGuaExRaw = GuaExDataMap.getGuaEx(bianGua.name)
        var finalBianEx: GuaExData? = nil
        if let bgEx = benGuaEx, let bgExRaw = bianGuaExRaw {
            let blq = GuaExDataMap.reloadLiuQin(bgEx.wuXing, bgExRaw.ganZhi)
            finalBianEx = GuaExData(name: bgExRaw.name, liuQin: blq.joined(),
                ganZhi: bgExRaw.ganZhi, shi: bgExRaw.shi, ying: bgExRaw.ying,
                fuCang: bgExRaw.fuCang, guaShen: bgExRaw.guaShen,
                baGong: bgExRaw.baGong, wuXing: bgExRaw.wuXing, kind: bgExRaw.kind)
        }

        var liuShen: [String]? = nil
        if ctx.ganZhi[2].count >= 1 {
            let dayGan = String(ctx.ganZhi[2].prefix(1))
            liuShen = GuaExDataMap.getLiuShen(dayGan)
        }

        var bianPos = -1
        for i in 0..<yaos.count {
            if yaos[i] == Yao.laoYang || yaos[i] == Yao.laoYin { bianPos = i; break }
        }

        return PaipanResult(method: "六爻手动起卦", ganZhi: ctx.ganZhi, xunKong: ctx.xunKong,
            benGua: benGua, huGua: huGua, bianGua: bianGua, bianYao: bianPos,
            shangGua: GuaData.guaNumToName(shangGua), xiaGua: GuaData.guaNumToName(xiaGua),
            shangGuaWuXing: GuaData.guaNumToWuXing(shangGua), xiaGuaWuXing: GuaData.guaNumToWuXing(xiaGua),
            benGuaEx: benGuaEx, bianGuaEx: finalBianEx, liuShen: liuShen)
    }
}
