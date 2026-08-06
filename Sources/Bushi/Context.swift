import Foundation
import LunarSwift

private let JIA_ZI = [
    "甲子","乙丑","丙寅","丁卯","戊辰","己巳","庚午","辛未","壬申","癸酉",
    "甲戌","乙亥","丙子","丁丑","戊寅","己卯","庚辰","辛巳","壬午","癸未",
    "甲申","乙酉","丙戌","丁亥","戊子","己丑","庚寅","辛卯","壬辰","癸巳",
    "甲午","乙未","丙申","丁酉","戊戌","己亥","庚子","辛丑","壬寅","癸卯",
    "甲辰","乙巳","丙午","丁未","戊申","己酉","庚戌","辛亥","壬子","癸丑",
    "甲寅","乙卯","丙辰","丁巳","戊午","己未","庚申","辛酉","壬戌","癸亥",
]

private let XUN_KONG = ["戌亥","申酉","午未","辰巳","寅卯","子丑"]

private func getXunKong(_ dayGanZhi: String) -> String {
    if let idx = JIA_ZI.firstIndex(of: dayGanZhi) {
        return XUN_KONG[idx / 10]
    }
    return ""
}

/// 晚子时换日：23:00~00:00 归入次日子时。
public func ziHourCalculationTime(_ dt: Date) -> Date {
    let cal = Calendar(identifier: .gregorian)
    let hour = cal.component(.hour, from: dt)
    if hour == 23 {
        return dt.addingTimeInterval(3600)
    }
    return dt
}

/// 从公历 Date 构建排盘上下文。
/// 23:00~00:00（晚子时）自动按次日子时排盘。
public func buildContext(_ dt: Date) -> DivinationContext {
    let calcTime = ziHourCalculationTime(dt)
    let lunar = Lunar.fromDate(date: calcTime)

    let ganZhi = [
        lunar.yearInGanZhi,
        lunar.monthInGanZhi,
        lunar.dayInGanZhi,
        lunar.timeInGanZhi,
    ]
    let xunKong = getXunKong(ganZhi[2])

    var lunarMonth = lunar.month
    if lunarMonth < 0 { lunarMonth = -lunarMonth }
    let lunarDay = lunar.day

    return DivinationContext(ganZhi: ganZhi, xunKong: xunKong,
                            lunarMonth: lunarMonth, lunarDay: lunarDay)
}
