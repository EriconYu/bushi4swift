import Foundation

public enum GuaExDataMap {

    public static let map: [String: GuaExData] = [
        "乾为天": GuaExData(
            name:"乾为天", liuQin:"父兄官父财子",
            ganZhi:["戌土", "申金", "午火", "辰土", "寅木", "子水"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:6, baGong:"乾", wuXing:"金", kind:"六冲"),
        "天风姤": GuaExData(
            name:"天风姤", liuQin:"父兄官兄子父",
            ganZhi:["戌土", "申金", "午火", "酉金", "亥水", "丑土"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:5,value:"寅木财")],
            guaShen:3, baGong:"乾", wuXing:"金", kind:""),
        "天山遁": GuaExData(
            name:"天山遁", liuQin:"父兄官兄官父",
            ganZhi:["戌土", "申金", "午火", "申金", "午火", "辰土"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:5,value:"寅木财"), FuCang(pos:6,value:"子水子")],
            guaShen:0, baGong:"乾", wuXing:"金", kind:""),
        "天地否": GuaExData(
            name:"天地否", liuQin:"父兄官财官父",
            ganZhi:["戌土", "申金", "午火", "卯木", "巳火", "未土"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:6,value:"子水子")],
            guaShen:2, baGong:"乾", wuXing:"金", kind:"六合"),
        "风地观": GuaExData(
            name:"风地观", liuQin:"财官父财官父",
            ganZhi:["卯木", "巳火", "未土", "卯木", "巳火", "未土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:2,value:"兄申金"), FuCang(pos:6,value:"子水子")],
            guaShen:0, baGong:"乾", wuXing:"金", kind:""),
        "山地剥": GuaExData(
            name:"山地剥", liuQin:"财子父财官父",
            ganZhi:["寅木", "子水", "戌土", "卯木", "巳火", "未土"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:2,value:"兄申金")],
            guaShen:3, baGong:"乾", wuXing:"金", kind:""),
        "火地晋": GuaExData(
            name:"火地晋", liuQin:"官父兄财官父",
            ganZhi:["巳火", "未土", "酉金", "卯木", "巳火", "未土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:6,value:"子子水")],
            guaShen:4, baGong:"乾", wuXing:"金", kind:"游魂"),
        "火天大有": GuaExData(
            name:"火天大有", liuQin:"官父兄父财子",
            ganZhi:["巳火", "未土", "酉金", "辰土", "寅木", "子水"],
            shi:4, ying:1,
            fuCang:[],
            guaShen:5, baGong:"乾", wuXing:"金", kind:"归魂"),
        "坎为水": GuaExData(
            name:"坎为水", liuQin:"兄官父财官子",
            ganZhi:["子水", "戌土", "申金", "午火", "辰土", "寅木"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:0, baGong:"坎", wuXing:"水", kind:"六冲"),
        "水泽节": GuaExData(
            name:"水泽节", liuQin:"兄官父官子财",
            ganZhi:["子水", "戌土", "申金", "丑土", "卯木", "巳火"],
            shi:6, ying:3,
            fuCang:[],
            guaShen:1, baGong:"坎", wuXing:"水", kind:"六合"),
        "水雷屯": GuaExData(
            name:"水雷屯", liuQin:"兄官父官子兄",
            ganZhi:["子水", "戌土", "申金", "辰土", "寅木", "子水"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:4,value:"财午火")],
            guaShen:0, baGong:"坎", wuXing:"水", kind:""),
        "水火既济": GuaExData(
            name:"水火既济", liuQin:"兄官父兄官子",
            ganZhi:["子水", "戌土", "申金", "亥水", "丑土", "卯木"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:4,value:"财午火")],
            guaShen:6, baGong:"坎", wuXing:"水", kind:""),
        "泽火革": GuaExData(
            name:"泽火革", liuQin:"官父兄兄官子",
            ganZhi:["未土", "酉金", "亥水", "亥水", "丑土", "卯木"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:4,value:"财午火")],
            guaShen:6, baGong:"坎", wuXing:"水", kind:""),
        "雷火丰": GuaExData(
            name:"雷火丰", liuQin:"官父财兄官子",
            ganZhi:["戌土", "申金", "午火", "亥水", "丑土", "卯木"],
            shi:2, ying:5,
            fuCang:[],
            guaShen:6, baGong:"坎", wuXing:"水", kind:""),
        "地火明夷": GuaExData(
            name:"地火明夷", liuQin:"父兄官兄官子",
            ganZhi:["酉金", "亥水", "丑土", "亥水", "丑土", "卯木"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:4,value:"财午火")],
            guaShen:1, baGong:"坎", wuXing:"水", kind:"游魂"),
        "地水师": GuaExData(
            name:"地水师", liuQin:"父兄官财官子",
            ganZhi:["酉金", "亥水", "丑土", "午火", "辰土", "寅木"],
            shi:4, ying:1,
            fuCang:[],
            guaShen:3, baGong:"坎", wuXing:"水", kind:"归魂"),
        "艮为山": GuaExData(
            name:"艮为山", liuQin:"官财兄子父兄",
            ganZhi:["寅木", "子水", "戌土", "申金", "午火", "辰土"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:0, baGong:"艮", wuXing:"土", kind:"六冲"),
        "山火贲": GuaExData(
            name:"山火贲", liuQin:"官财兄财兄官",
            ganZhi:["寅木", "子水", "戌土", "亥水", "丑土", "卯木"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:4,value:"子申金"), FuCang(pos:5,value:"父午火")],
            guaShen:2, baGong:"艮", wuXing:"土", kind:"六合"),
        "山天大畜": GuaExData(
            name:"山天大畜", liuQin:"官财兄兄官财",
            ganZhi:["寅木", "子水", "戌土", "辰土", "寅木", "子水"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:4,value:"子申金"), FuCang(pos:5,value:"父午火")],
            guaShen:6, baGong:"艮", wuXing:"土", kind:""),
        "山泽损": GuaExData(
            name:"山泽损", liuQin:"官财兄兄官父",
            ganZhi:["寅木", "子水", "戌土", "丑土", "卯木", "巳火"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:4,value:"子申金")],
            guaShen:4, baGong:"艮", wuXing:"土", kind:""),
        "火泽睽": GuaExData(
            name:"火泽睽", liuQin:"父兄子兄官父",
            ganZhi:["巳火", "未土", "酉金", "丑土", "卯木", "巳火"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:2,value:"财子水")],
            guaShen:5, baGong:"艮", wuXing:"土", kind:""),
        "天泽履": GuaExData(
            name:"天泽履", liuQin:"兄子父兄官父",
            ganZhi:["戌土", "申金", "午火", "丑土", "卯木", "巳火"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:2,value:"财子水")],
            guaShen:6, baGong:"艮", wuXing:"土", kind:""),
        "风泽中孚": GuaExData(
            name:"风泽中孚", liuQin:"官父兄兄官父",
            ganZhi:["卯木", "巳火", "未土", "丑土", "卯木", "巳火"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:2,value:"财子水"), FuCang(pos:4,value:"子申金")],
            guaShen:0, baGong:"艮", wuXing:"土", kind:"游魂"),
        "风山渐": GuaExData(
            name:"风山渐", liuQin:"官父兄子父兄",
            ganZhi:["卯木", "巳火", "未土", "申金", "午火", "辰土"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:2,value:"财子水")],
            guaShen:1, baGong:"艮", wuXing:"土", kind:"归魂"),
        "震为雷": GuaExData(
            name:"震为雷", liuQin:"财官子财兄父",
            ganZhi:["戌土", "申金", "午火", "辰土", "寅木", "子水"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:0, baGong:"震", wuXing:"木", kind:"六冲"),
        "雷地豫": GuaExData(
            name:"雷地豫", liuQin:"财官子兄子财",
            ganZhi:["戌土", "申金", "午火", "卯木", "巳火", "未土"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:6,value:"父子水")],
            guaShen:4, baGong:"震", wuXing:"木", kind:"六合"),
        "雷水解": GuaExData(
            name:"雷水解", liuQin:"财官子子财兄",
            ganZhi:["戌土", "申金", "午火", "午火", "辰土", "寅木"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:6,value:"父子水")],
            guaShen:0, baGong:"震", wuXing:"木", kind:""),
        "雷风恒": GuaExData(
            name:"雷风恒", liuQin:"财官子官父财",
            ganZhi:["戌土", "申金", "午火", "酉金", "亥水", "丑土"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:5,value:"兄寅木")],
            guaShen:5, baGong:"震", wuXing:"木", kind:""),
        "地风升": GuaExData(
            name:"地风升", liuQin:"官父财官父财",
            ganZhi:["酉金", "亥水", "丑土", "酉金", "亥水", "丑土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:3,value:"子午火"), FuCang(pos:5,value:"兄寅木")],
            guaShen:14, baGong:"震", wuXing:"木", kind:""),
        "水风井": GuaExData(
            name:"水风井", liuQin:"父财官官父财",
            ganZhi:["子水", "戌土", "申金", "酉金", "亥水", "丑土"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:3,value:"子午火"), FuCang(pos:5,value:"兄寅木")],
            guaShen:4, baGong:"震", wuXing:"木", kind:""),
        "泽风大过": GuaExData(
            name:"泽风大过", liuQin:"财官父官父财",
            ganZhi:["未土", "酉金", "亥水", "酉金", "亥水", "丑土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:3,value:"子午火"), FuCang(pos:5,value:"兄寅木")],
            guaShen:0, baGong:"震", wuXing:"木", kind:"游魂"),
        "泽雷随": GuaExData(
            name:"泽雷随", liuQin:"财官父财兄父",
            ganZhi:["未土", "酉金", "亥水", "辰土", "寅木", "子水"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:3,value:"子午火")],
            guaShen:2, baGong:"震", wuXing:"木", kind:"归魂"),
        "巽为风": GuaExData(
            name:"巽为风", liuQin:"兄子财官父财",
            ganZhi:["卯木", "巳火", "未土", "酉金", "亥水", "丑土"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:2, baGong:"巽", wuXing:"木", kind:"六冲"),
        "风天小畜": GuaExData(
            name:"风天小畜", liuQin:"兄子财财兄父",
            ganZhi:["卯木", "巳火", "未土", "辰土", "寅木", "子水"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:4,value:"官酉金")],
            guaShen:6, baGong:"巽", wuXing:"木", kind:""),
        "风火家人": GuaExData(
            name:"风火家人", liuQin:"兄子财父财兄",
            ganZhi:["卯木", "巳火", "未土", "亥水", "丑土", "卯木"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:4,value:"官酉金")],
            guaShen:3, baGong:"巽", wuXing:"木", kind:""),
        "风雷益": GuaExData(
            name:"风雷益", liuQin:"兄子财财兄父",
            ganZhi:["卯木", "巳火", "未土", "辰土", "寅木", "子水"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:4,value:"官酉金")],
            guaShen:5, baGong:"巽", wuXing:"木", kind:""),
        "天雷无妄": GuaExData(
            name:"天雷无妄", liuQin:"财官子财兄父",
            ganZhi:["戌土", "申金", "午火", "辰土", "寅木", "子水"],
            shi:3, ying:6,
            fuCang:[],
            guaShen:1, baGong:"巽", wuXing:"木", kind:"六冲"),
        "火雷噬嗑": GuaExData(
            name:"火雷噬嗑", liuQin:"子财官财兄父",
            ganZhi:["巳火", "未土", "酉金", "辰土", "寅木", "子水"],
            shi:2, ying:5,
            fuCang:[],
            guaShen:0, baGong:"巽", wuXing:"木", kind:""),
        "山雷颐": GuaExData(
            name:"山雷颐", liuQin:"兄父财财兄父",
            ganZhi:["寅木", "子水", "戌土", "辰土", "寅木", "子水"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:2,value:"子巳火"), FuCang(pos:4,value:"官酉金")],
            guaShen:4, baGong:"巽", wuXing:"木", kind:"游魂"),
        "山风蛊": GuaExData(
            name:"山风蛊", liuQin:"兄父财官父财",
            ganZhi:["寅木", "子水", "戌土", "酉金", "亥水", "丑土"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:2,value:"子巳火")],
            guaShen:1, baGong:"巽", wuXing:"木", kind:"归魂"),
        "离为火": GuaExData(
            name:"离为火", liuQin:"兄子财官子父",
            ganZhi:["巳火", "未土", "酉金", "亥水", "丑土", "卯木"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:1, baGong:"离", wuXing:"火", kind:"六冲"),
        "火山旅": GuaExData(
            name:"火山旅", liuQin:"兄子财财兄子",
            ganZhi:["巳火", "未土", "酉金", "申金", "午火", "辰土"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:4,value:"官亥水"), FuCang(pos:6,value:"父卯木")],
            guaShen:5, baGong:"离", wuXing:"火", kind:"六合"),
        "火风鼎": GuaExData(
            name:"火风鼎", liuQin:"兄子财财官子",
            ganZhi:["巳火", "未土", "酉金", "酉金", "亥水", "丑土"],
            shi:5, ying:2,
            fuCang:[FuCang(pos:6,value:"财卯木")],
            guaShen:6, baGong:"离", wuXing:"火", kind:""),
        "火水未济": GuaExData(
            name:"火水未济", liuQin:"兄子财兄子父",
            ganZhi:["巳火", "未土", "酉金", "午火", "辰土", "寅木"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:4,value:"官亥水")],
            guaShen:0, baGong:"离", wuXing:"火", kind:""),
        "山水蒙": GuaExData(
            name:"山水蒙", liuQin:"父官子兄子父",
            ganZhi:["寅木", "子水", "戌土", "午火", "辰土", "寅木"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:3,value:"财酉金")],
            guaShen:3, baGong:"离", wuXing:"火", kind:""),
        "风水涣": GuaExData(
            name:"风水涣", liuQin:"父兄子兄子父",
            ganZhi:["卯木", "巳火", "未土", "午火", "辰土", "寅木"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:3,value:"财酉金"), FuCang(pos:4,value:"官亥水")],
            guaShen:5, baGong:"离", wuXing:"火", kind:""),
        "天水讼": GuaExData(
            name:"天水讼", liuQin:"子财兄兄子父",
            ganZhi:["戌土", "申金", "午火", "午火", "辰土", "寅木"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:4,value:"官亥水")],
            guaShen:6, baGong:"离", wuXing:"火", kind:"游魂"),
        "天火同人": GuaExData(
            name:"天火同人", liuQin:"子财兄官子父",
            ganZhi:["戌土", "申金", "午火", "亥水", "丑土", "卯木"],
            shi:4, ying:1,
            fuCang:[],
            guaShen:6, baGong:"离", wuXing:"火", kind:"归魂"),
        "坤为地": GuaExData(
            name:"坤为地", liuQin:"子财兄官父兄",
            ganZhi:["酉金", "亥水", "丑土", "卯木", "巳火", "未土"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:2, baGong:"坤", wuXing:"土", kind:"六冲"),
        "地雷复": GuaExData(
            name:"地雷复", liuQin:"子财兄兄官财",
            ganZhi:["酉金", "亥水", "丑土", "辰土", "寅木", "子水"],
            shi:6, ying:3,
            fuCang:[FuCang(pos:5,value:"父巳火")],
            guaShen:6, baGong:"坤", wuXing:"土", kind:"六合"),
        "地泽临": GuaExData(
            name:"地泽临", liuQin:"子财兄兄官父",
            ganZhi:["酉金", "亥水", "丑土", "丑土", "卯木", "巳火"],
            shi:5, ying:2,
            fuCang:[],
            guaShen:34, baGong:"坤", wuXing:"土", kind:""),
        "地天泰": GuaExData(
            name:"地天泰", liuQin:"子财兄兄官财",
            ganZhi:["酉金", "亥水", "丑土", "辰土", "寅木", "子水"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:5,value:"父巳火")],
            guaShen:5, baGong:"坤", wuXing:"土", kind:"六合"),
        "雷天大壮": GuaExData(
            name:"雷天大壮", liuQin:"兄子父兄官财",
            ganZhi:["戌土", "申金", "午火", "辰土", "寅木", "子水"],
            shi:3, ying:6,
            fuCang:[],
            guaShen:4, baGong:"坤", wuXing:"土", kind:"六冲"),
        "泽天夬": GuaExData(
            name:"泽天夬", liuQin:"兄子财兄官财",
            ganZhi:["未土", "酉金", "亥水", "辰土", "寅木", "子水"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:5,value:"父巳火")],
            guaShen:4, baGong:"坤", wuXing:"土", kind:""),
        "水天需": GuaExData(
            name:"水天需", liuQin:"财兄子兄官财",
            ganZhi:["子水", "戌土", "申金", "辰土", "寅木", "子水"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:5,value:"父巳火")],
            guaShen:1, baGong:"坤", wuXing:"土", kind:"游魂"),
        "水地比": GuaExData(
            name:"水地比", liuQin:"财兄子官父兄",
            ganZhi:["子水", "戌土", "申金", "卯木", "巳火", "未土"],
            shi:4, ying:1,
            fuCang:[],
            guaShen:3, baGong:"坤", wuXing:"土", kind:"归魂"),
        "兑为泽": GuaExData(
            name:"兑为泽", liuQin:"父兄子父财官",
            ganZhi:["未土", "酉金", "亥水", "丑土", "卯木", "巳火"],
            shi:1, ying:4,
            fuCang:[],
            guaShen:3, baGong:"兑", wuXing:"金", kind:"六冲"),
        "泽水困": GuaExData(
            name:"泽水困", liuQin:"父兄子官父财",
            ganZhi:["未土", "酉金", "亥水", "午火", "辰土", "寅木"],
            shi:6, ying:3,
            fuCang:[],
            guaShen:4, baGong:"兑", wuXing:"金", kind:"六合"),
        "泽地萃": GuaExData(
            name:"泽地萃", liuQin:"父兄子财官父",
            ganZhi:["未土", "酉金", "亥水", "卯木", "巳火", "未土"],
            shi:5, ying:2,
            fuCang:[],
            guaShen:1, baGong:"兑", wuXing:"金", kind:""),
        "泽山咸": GuaExData(
            name:"泽山咸", liuQin:"父兄子兄官父",
            ganZhi:["未土", "酉金", "亥水", "申金", "午火", "辰土"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:5,value:"财卯木")],
            guaShen:6, baGong:"兑", wuXing:"金", kind:""),
        "水山蹇": GuaExData(
            name:"水山蹇", liuQin:"子父兄兄官父",
            ganZhi:["子水", "戌土", "申金", "申金", "午火", "辰土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:5,value:"财卯木")],
            guaShen:2, baGong:"兑", wuXing:"金", kind:""),
        "地山谦": GuaExData(
            name:"地山谦", liuQin:"兄子父兄官父",
            ganZhi:["酉金", "亥水", "丑土", "申金", "午火", "辰土"],
            shi:2, ying:5,
            fuCang:[FuCang(pos:5,value:"财卯木")],
            guaShen:0, baGong:"兑", wuXing:"金", kind:""),
        "雷山小过": GuaExData(
            name:"雷山小过", liuQin:"父兄官兄官父",
            ganZhi:["戌土", "申金", "午火", "申金", "午火", "辰土"],
            shi:3, ying:6,
            fuCang:[FuCang(pos:3,value:"子亥水"), FuCang(pos:5,value:"财卯木")],
            guaShen:5, baGong:"兑", wuXing:"金", kind:"游魂"),
        "雷泽归妹": GuaExData(
            name:"雷泽归妹", liuQin:"父兄官父财官",
            ganZhi:["戌土", "申金", "午火", "丑土", "卯木", "巳火"],
            shi:4, ying:1,
            fuCang:[FuCang(pos:3,value:"子亥水")],
            guaShen:0, baGong:"兑", wuXing:"金", kind:"归魂"),
    ]

    private static let LIU_SHEN_MAP: [String: [String]] = [
        "甲":["玄武","白虎","螣蛇","勾陈","朱雀","青龙"],
        "乙":["玄武","白虎","螣蛇","勾陈","朱雀","青龙"],
        "丙":["青龙","玄武","白虎","螣蛇","勾陈","朱雀"],
        "丁":["青龙","玄武","白虎","螣蛇","勾陈","朱雀"],
        "戊":["朱雀","青龙","玄武","白虎","螣蛇","勾陈"],
        "己":["勾陈","朱雀","青龙","玄武","白虎","螣蛇"],
        "庚":["螣蛇","勾陈","朱雀","青龙","玄武","白虎"],
        "辛":["螣蛇","勾陈","朱雀","青龙","玄武","白虎"],
        "壬":["白虎","螣蛇","勾陈","朱雀","青龙","玄武"],
        "癸":["白虎","螣蛇","勾陈","朱雀","青龙","玄武"],
    ]

    private static let DI_ZHI_WU_XING: [String: String] = [
        "子":"水","丑":"土","寅":"木","卯":"木","辰":"土","巳":"火",
        "午":"火","未":"土","申":"金","酉":"金","戌":"土","亥":"水",
    ]

    private static let GEN_LIUQIN: [String: [String: String]] = [
        "木":["水":"父","木":"兄","火":"子","土":"财","金":"官"],
        "火":["水":"官","木":"父","火":"兄","土":"子","金":"财"],
        "土":["水":"财","木":"官","火":"父","土":"兄","金":"子"],
        "金":["水":"子","木":"财","火":"官","土":"父","金":"兄"],
        "水":["水":"兄","木":"子","火":"财","土":"官","金":"父"],
    ]

    public static func getLiuShen(_ dayGan: String) -> [String]? {
        LIU_SHEN_MAP[dayGan]
    }

    public static func reloadLiuQin(_ guaWuXing: String, _ ganZhi: [String]) -> [String] {
        guard let wxMap = GEN_LIUQIN[guaWuXing] else { return ["","","","","",""] }
        var result = ["","","","","",""]
        for i in 0..<min(6, ganZhi.count) {
            if ganZhi[i].isEmpty { continue }
            let dz = String(ganZhi[i].prefix(1))
            guard let dzwx = DI_ZHI_WU_XING[dz], let lq = wxMap[dzwx] else { continue }
            result[i] = lq
        }
        return result
    }

    public static func getGuaEx(_ guaName: String) -> GuaExData? {
        map[guaName]
    }
}