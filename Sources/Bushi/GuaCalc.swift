// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import Foundation

public enum GuaCalc {
    public static func getHuGuaYaos(_ benYaos: [Int]) -> [Int] {
        return [
            GuaData.yaoToYinYang(benYaos[1]), GuaData.yaoToYinYang(benYaos[2]), GuaData.yaoToYinYang(benYaos[3]),
            GuaData.yaoToYinYang(benYaos[2]), GuaData.yaoToYinYang(benYaos[3]), GuaData.yaoToYinYang(benYaos[4]),
        ]
    }

    public static func getBianGuaYaos(_ benYaos: [Int], pos: Int) -> [Int] {
        var bian: [Int] = [0,0,0,0,0,0]
        for i in 0..<6 {
            bian[i] = benYaos[i]
            let isMoving = bian[i] == Yao.laoYang || bian[i] == Yao.laoYin
            let isThisMoving = (pos == -1 && isMoving) || (pos >= 0 && i == pos && isMoving)
            if isThisMoving {
                bian[i] = bian[i] == Yao.laoYang ? Yao.shaoYin : Yao.shaoYang
            } else {
                bian[i] = GuaData.yaoToYinYang(bian[i])
            }
        }
        return bian
    }

    public static func get64GuaNameByYaos(_ yaos: [Int]) -> String {
        let yt = yaos.map { GuaData.yaoToYinYang($0) }
        let shang = [yt[2], yt[1], yt[0]]
        let xia = [yt[5], yt[4], yt[3]]
        let sg = GuaData.yaosToBaGuaNum(shang)
        let xg = GuaData.yaosToBaGuaNum(xia)
        if sg < 1 || sg > 8 || xg < 1 || xg > 8 { return "" }
        return GuaData.guas64[sg-1][xg-1]
    }
}
