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
}
