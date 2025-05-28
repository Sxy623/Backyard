//
//  UserIdentity.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import Foundation

enum UserIdentity: String, CaseIterable {
    case farmer = "小院农户"
    case student = "学生"
    
    var icon: String {
        switch self {
        case .farmer:
            return "house.fill"
        case .student:
            return "graduationcap.fill"
        }
    }
    
    var description: String {
        switch self {
        case .farmer:
            return "我是小院的农户，负责农业生产和管理"
        case .student:
            return "我是学生，参与小院的学习和研究活动"
        }
    }
} 
