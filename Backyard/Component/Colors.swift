//
//  Colors.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    struct Brand {
        static var _1: Color { return Color(hex: "28781A") }
        static var _2: Color { return Color(hex: "CFF07C") }
        static var _3: Color { return Color(hex: "8CC544") }
        static var _4: Color { return Color(hex: "3E6F35") }
        static var _5: Color { return Color(hex: "1A3F2F") }
        static var _6: Color { return Color(hex: "F8FDEB") }
    }
}
