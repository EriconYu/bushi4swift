// Copyright (c) 2026 不惑之心 (buhuo.xin)
// 作者：净志 | 微信：haitaojingzhi | 官网：https://www.buhuo.xin
// 仅开源排盘算法，不含卦爻辞、解卦等内容。

import Foundation

public struct GuaTexts: Codable {
    public let id: Int
    public let name: String
    public let yaoCi: String  // 卦爻辞（原文、译文、注释）
    public let jieXi: String  // 解卦（白话文、邵雍、傅佩荣、张铭仁等解析）
}

public enum GuaTextsLoader {
    private static var cache: [String: GuaTexts]? = nil

    private static func initCache() {
        if cache != nil { return }
        guard let url = Bundle.module.url(forResource: "gua_texts", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([String: GuaTexts].self, from: data) else {
            cache = [:]
            return
        }
        cache = decoded
    }

    /// 按完整卦名同步读取包内文本；卦名不存在时返回 nil，无需预加载。
    public static func getGuaTexts(_ guaName: String) -> GuaTexts? {
        initCache()
        return cache?[guaName]
    }

    /// 返回包内全部 64 卦文本。
    public static func getAllGuaTexts() -> [String: GuaTexts] {
        initCache()
        return cache ?? [:]
    }
}
