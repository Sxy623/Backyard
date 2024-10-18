//
//  DetailedAlertCardData.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import Foundation
import SwiftUI

@Observable
class DetailedAlertCardData: ObservableObject, Identifiable {
    var alertImage: Image
    var alertName: String
    var alertLocation: String
    var alertDate: String
    var alertDescription: String
    var responsePlan: String
    var historicalResponse: String
    var currentResponse: String
    var buttonSelected: Int
    var isSolved: Bool // 新增的变量

    init(alertImage: Image, alertName: String, alertLocation: String, alertDate: String, alertDescription: String, responsePlan: String, historicalResponse: String, currentResponse: String, buttonSelected: Int, isSolved: Bool = false) {
        self.alertImage = alertImage
        self.alertName = alertName
        self.alertLocation = alertLocation
        self.alertDate = alertDate
        self.alertDescription = alertDescription
        self.responsePlan = responsePlan
        self.historicalResponse = historicalResponse
        self.currentResponse = currentResponse
        self.buttonSelected = buttonSelected
        self.isSolved = isSolved // 默认设置为 false
    }
}


// 创建两个实例
let powderyMildewAlert = DetailedAlertCardData(
    alertImage: Image("PowderyMildew"),
    alertName: "7 号预警：白粉病",
    alertLocation: "2号试验田",
    alertDate: "2024.10.06",
    alertDescription: """
        白粉病是由多种白粉菌属真菌引起的一种常见植物病害，主要影响多种农作物、果树、蔬菜和观赏植物。它以白色粉末状真菌孢子堆积在植物叶片、茎干和果实表面为主要特征，严重时会导致植物生长受阻、叶片枯黄、果实畸形甚至植物死亡。
        白粉病的特征：
            1.病症表现：
                • 叶片、茎和果实表面形成白色或灰白色的粉状物（真菌孢子）。
                • 受害部位的叶片可能逐渐变黄、干枯，严重时出现早落。
                • 幼苗和嫩芽最易受感染，导致植物矮小和畸形。
            2.发病条件
                • 高湿度、温暖且通风不良的环境最易爆发白粉病。
                • 夜间湿度大，白天干燥，温度一般在15℃至30℃的范围内是病害高发期。
                • 密集种植、光照不足和植株抵抗力下降也是诱发白粉病的因素。
        """,
    responsePlan: "应对方案 1",
    historicalResponse: "历史方案 1",
    currentResponse: "当前记录 1",
    buttonSelected: 0,
    isSolved: false // 设置为 false
)

let leafMoldAlert = DetailedAlertCardData(
    alertImage: Image("LeafMold"),
    alertName: "6 号预警：叶霉病",
    alertLocation: "3 号试验田",
    alertDate: "2024.10.03",
    alertDescription: "番茄叶霉病是真菌性病害。发病后在番茄的叶、茎、花、果实上都会出现症状，但是常见的是发生在叶片上，初期在叶片背面出现一些褪绿斑，后期变为灰色或黑紫色的不规则形霉层，叶片正面在相应的部位褪绿变黄，严重时叶片常出现干枯卷缩。",
    responsePlan: "应对方案 2",
    historicalResponse: "历史方案 2",
    currentResponse: "当前记录 2",
    buttonSelected: 0,
    isSolved: false // 设置为 false
)

let pestAlerts = [powderyMildewAlert, leafMoldAlert]
