//
//  ResearchCardShape.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import SwiftUI

struct ResearchCardShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midmidX: CGFloat = 170.0
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: midmidX - 20, y: rect.minY))
        path.addLine(to: CGPoint(x: midmidX, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.minY + 20))
        path.addArc(center: CGPoint(x: rect.maxX - 20, y: rect.minY + 40),
                    radius: 20,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

