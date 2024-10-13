//
//  Tabs.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/10.
//

import SwiftUI

enum Tabs: Equatable, Hashable, Identifiable {
    case 数据监测
    case 智能预警
    case 科研支持
    case 供销管理
    
    var id: Int {
        switch self {
        case .数据监测: 2001
        case .智能预警: 2002
        case .科研支持: 2003
        case .供销管理: 2004
        }
    }
    
    var name: String {
        switch self {
        case .数据监测: "数据监测"
        case .智能预警: "智能预警"
        case .科研支持: "科研支持"
        case .供销管理: "供销管理"
        }
    }
    
    var symbol: String {
        switch self {
        case .数据监测: "chart.bar"
        case .智能预警: "alarm"
        case .科研支持: "graduationcap"
        case .供销管理: "tray"
        }
    }
    
    var customizationID: String {
        return "com.sxy.backyard." + self.name
    }
}
