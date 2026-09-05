// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import XCTest
@testable import Bushi

final class BushiTests: XCTestCase {
    func testGuas64() {
        XCTAssertEqual(GuaData.guas64[0][0], "乾为天")
        XCTAssertEqual(GuaData.guas64[7][7], "坤为地")
        XCTAssertEqual(GuaData.guas64[7][5], "地水师")
    }

    func testGuaExMapSize() {
        XCTAssertEqual(GuaExDataMap.map.count, 64)
    }

    func testLiuYaoShiJian() {
        var comp = DateComponents()
        comp.year = 2026; comp.month = 4; comp.day = 30
        comp.hour = 10; comp.minute = 0; comp.second = 0
        comp.timeZone = TimeZone(identifier: "Asia/Shanghai")
        let cal = Calendar(identifier: .gregorian)
        let dt = cal.date(from: comp)!
        let ctx = buildContext(dt)
        let result = LiuYao.shiJianQiGua(ctx)
        XCTAssertEqual(result.benGua.name, "地水师")
        XCTAssertEqual(result.bianGua?.name, "山水蒙")
    }

    func testMeiHuaShiJian() {
        var comp = DateComponents()
        comp.year = 2026; comp.month = 4; comp.day = 29
        comp.hour = 19; comp.minute = 0; comp.second = 0
        comp.timeZone = TimeZone(identifier: "Asia/Shanghai")
        let cal = Calendar(identifier: .gregorian)
        let dt = cal.date(from: comp)!
        let ctx = buildContext(dt)
        let result = MeiHua.shiJianQiGua(ctx)
        XCTAssertEqual(result.benGua.name, "山泽损")
        XCTAssertEqual(result.bianGua?.name, "火泽睽")
    }

    func testZiHour() {
        let cal = Calendar(identifier: .gregorian)
        var c1 = DateComponents()
        c1.year = 2026; c1.month = 4; c1.day = 30; c1.hour = 23
        c1.timeZone = TimeZone(identifier: "Asia/Shanghai")
        var c2 = DateComponents()
        c2.year = 2026; c2.month = 5; c2.day = 1; c2.hour = 0
        c2.timeZone = TimeZone(identifier: "Asia/Shanghai")
        let ctx23 = buildContext(cal.date(from: c1)!)
        let ctxNext = buildContext(cal.date(from: c2)!)
        XCTAssertEqual(ctx23.ganZhi[2], ctxNext.ganZhi[2])
    }

    func testBianGua() {
        var yaos = [Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang]
        yaos[0] += 2
        let bian = GuaCalc.getBianGuaYaos(yaos, pos: 0)
        XCTAssertEqual(bian[0], Yao.shaoYin)
    }

    func testShouYao() {
        var comp = DateComponents()
        comp.year = 2026; comp.month = 4; comp.day = 30
        comp.hour = 10; comp.minute = 0; comp.second = 0
        comp.timeZone = TimeZone(identifier: "Asia/Shanghai")
        let cal = Calendar(identifier: .gregorian)
        let dt = cal.date(from: comp)!
        let ctx = buildContext(dt)
        let yaos = [Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang, Yao.shaoYang]
        let result = LiuYao.shouYaoQiGua(ctx, yaos: yaos)
        XCTAssertEqual(result.benGua.name, "乾为天")
    }

    func testStandardLiuYaoLayout() {
        let ctx = DivinationContext(
            ganZhi: ["丙午", "丙申", "甲寅", "乙亥"], xunKong: "子丑",
            lunarMonth: 6, lunarDay: 26
        )
        let result = LiuYao.shiJianQiGua(ctx)

        XCTAssertEqual(result.benGua.name, "山火贲")
        XCTAssertEqual(result.benGua.yaos, [1, 2, 2, 3, 2, 1])
        XCTAssertEqual(result.bianGua?.name, "山雷颐")
        XCTAssertEqual(result.bianGua?.yaos, [1, 2, 2, 2, 2, 1])
        XCTAssertEqual(result.liuShen ?? [], ["玄武", "白虎", "螣蛇", "勾陈", "朱雀", "青龙"])

        XCTAssertEqual(result.benGuaEx?.liuQin, "官财兄财兄官")
        XCTAssertEqual(result.benGuaEx?.ganZhi ?? [], ["寅木", "子水", "戌土", "亥水", "丑土", "卯木"])
        XCTAssertEqual(result.benGuaEx?.shi, 6)
        XCTAssertEqual(result.benGuaEx?.ying, 3)
        XCTAssertEqual(result.benGuaEx?.fuCang.map { "\($0.pos):\($0.value)" } ?? [], ["4:子申金", "5:父午火"])

        XCTAssertEqual(result.bianGuaEx?.liuQin, "官财兄兄官财")
        XCTAssertEqual(result.bianGuaEx?.shi, 3)
        XCTAssertEqual(result.bianGuaEx?.ying, 6)
        XCTAssertEqual(result.bianGuaEx?.fuCang.map { "\($0.pos):\($0.value)" } ?? [], ["2:子巳火", "4:官酉金"])
    }

    func testManualYaoDirectionAndMultipleChanges() {
        let ctx = DivinationContext(
            ganZhi: ["丙午", "丙申", "甲寅", "乙亥"], xunKong: "子丑",
            lunarMonth: 6, lunarDay: 26
        )
        let bottomUp = [Yao.shaoYang, Yao.shaoYin, Yao.laoYang, Yao.shaoYin, Yao.shaoYin, Yao.shaoYang]
        let standard = LiuYao.shouYaoQiGua(ctx, yaos: Array(bottomUp.reversed()))
        XCTAssertEqual(standard.benGua.name, "山火贲")
        XCTAssertEqual(standard.bianGua?.name, "山雷颐")

        let multiple = LiuYao.shouYaoQiGua(
            ctx,
            yaos: [Yao.laoYang, Yao.shaoYin, Yao.shaoYin, Yao.laoYang, Yao.shaoYin, Yao.shaoYang]
        )
        XCTAssertEqual(multiple.bianYao, 0)
        XCTAssertEqual(multiple.bianGua?.yaos[0], Yao.shaoYin)
        XCTAssertEqual(multiple.bianGua?.yaos[3], Yao.shaoYin)
    }

    func testNumberDivinationUsesModuloSix() {
        let ctx = DivinationContext(
            ganZhi: ["丙午", "丙申", "甲寅", "乙亥"], xunKong: "子丑",
            lunarMonth: 6, lunarDay: 26
        )
        let cases = [0: 0, 1: 5, 6: 0, 7: 5, 12: 0, 13: 5]
        for (yaoNumber, expectedIndex) in cases {
            XCTAssertEqual(LiuYao.movingLineIndex(yaoNumber), expectedIndex)

            let liuYao = LiuYao.shuZiQiGua(ctx, numbers: [1, 1, yaoNumber])
            XCTAssertEqual(liuYao.bianYao, expectedIndex)
            XCTAssertEqual(liuYao.benGua.yaos.enumerated().filter { $0.element >= 3 }.map(\.offset), [expectedIndex])

            let meiHua = MeiHua.shuZiQiGua(ctx, numbers: [1, 1, yaoNumber])
            XCTAssertEqual(meiHua.bianYao, expectedIndex)
        }
        XCTAssertEqual(LiuYao.shuZiQiGua(ctx, numbers: [1, 1, 1]).bianGua?.name, "天风姤")
    }

    func testRandomAndManualMovingLineInvariants() {
        let ctx = DivinationContext(
            ganZhi: ["丙午", "丙申", "甲寅", "乙亥"], xunKong: "子丑",
            lunarMonth: 6, lunarDay: 26
        )
        for _ in 0..<20 {
            let result = LiuYao.suiJiQiGua(ctx)
            XCTAssertTrue((0..<6).contains(result.bianYao))
            XCTAssertEqual(result.benGua.yaos.filter { $0 == Yao.laoYang || $0 == Yao.laoYin }.count, 1)
        }
        let staticLiuYao = LiuYao.shouYaoQiGua(ctx, yaos: Array(repeating: Yao.shaoYang, count: 6))
        XCTAssertEqual(staticLiuYao.bianYao, -1)
        XCTAssertNil(staticLiuYao.bianGua)
        XCTAssertNil(staticLiuYao.bianGuaEx)
        let staticResult = MeiHua.shouYaoQiGua(ctx, yaos: Array(repeating: Yao.shaoYang, count: 6))
        XCTAssertEqual(staticResult.bianYao, -1)
    }

    func testBundledGuaTexts() {
        XCTAssertEqual(GuaTextsLoader.getGuaTexts("乾为天")?.name, "乾为天")
        XCTAssertNil(GuaTextsLoader.getGuaTexts("不存在"))
        XCTAssertEqual(GuaTextsLoader.getAllGuaTexts().count, 64)
    }
}
