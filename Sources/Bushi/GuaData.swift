import Foundation

public enum GuaData {
    public static let guas64: [[String]] = [
        ["乾为天","天泽履","天火同人","天雷无妄","天风姤","天水讼","天山遁","天地否"],
        ["泽天夬","兑为泽","泽火革","泽雷随","泽风大过","泽水困","泽山咸","泽地萃"],
        ["火天大有","火泽睽","离为火","火雷噬嗑","火风鼎","火水未济","火山旅","火地晋"],
        ["雷天大壮","雷泽归妹","雷火丰","震为雷","雷风恒","雷水解","雷山小过","雷地豫"],
        ["风天小畜","风泽中孚","风火家人","风雷益","巽为风","风水涣","风山渐","风地观"],
        ["水天需","水泽节","水火既济","水雷屯","水风井","坎为水","水山蹇","水地比"],
        ["山天大畜","山泽损","山火贲","山雷颐","山风蛊","山水蒙","艮为山","山地剥"],
        ["地天泰","地泽临","地火明夷","地雷复","地风升","地水师","地山谦","坤为地"],
    ]

    public static let baGuaNames = ["乾","兑","离","震","巽","坎","艮","坤"]
    public static let baGuaWuXing = ["金","金","火","木","木","水","土","土"]
    public static let diZhi12 = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]

    public static func baGuaNumToYaos(_ num: Int) -> [Int] {
        switch num {
        case 1: return [1,1,1]
        case 2: return [1,1,2]
        case 3: return [1,2,1]
        case 4: return [1,2,2]
        case 5: return [2,1,1]
        case 6: return [2,1,2]
        case 7: return [2,2,1]
        case 8: return [2,2,2]
        default: return [0,0,0]
        }
    }

    public static func yaosToBaGuaNum(_ yaos: [Int]) -> Int {
        let sum = yaos[0]*100 + yaos[1]*10 + yaos[2]
        switch sum {
        case 111: return 1; case 112: return 2; case 121: return 3; case 122: return 4
        case 211: return 5; case 212: return 6; case 221: return 7; case 222: return 8
        default: return 0
        }
    }

    public static func yaoToYinYang(_ yao: Int) -> Int { yao > 2 ? yao - 2 : yao }

    public static func guaNumToName(_ num: Int) -> String {
        num >= 1 && num <= 8 ? baGuaNames[num-1] : ""
    }

    public static func guaNumToWuXing(_ num: Int) -> String {
        num >= 1 && num <= 8 ? baGuaWuXing[num-1] : ""
    }

    public static func getZhiIndex(_ zhi: String) -> Int {
        for i in 0..<12 where diZhi12[i] == zhi { return i + 1 }
        return 0
    }
}
