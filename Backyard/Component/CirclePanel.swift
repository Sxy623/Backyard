//
//  CirclePanel.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/17.
//

import SwiftUI

struct CirclePanel: View {
    
    @State private var currentRotation: Double = 0
    @State private var currentPercentage: Double = 0
    @State private var color: Color = Color(hex: 0x2B781A)
    @State private var radius: CGFloat = 40
    
    var number: String = "6132"
    var unit: String = "mV"
    var percentage: Double = 0.65
    var rotation: Double = 310
    var title: String = "设备电量"
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 6)
                    .frame(width: radius * 2, height: radius * 2)
                
                Circle()
                    .trim(from: 0, to: currentPercentage)
                    .stroke(color, lineWidth: 6)
                    .frame(width: radius * 2, height: radius * 2)
                    .rotationEffect(.degrees(currentRotation))
                    .onAppear {
                        withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.2).delay(0.5)) {
                            self.currentPercentage = percentage
                            self.currentRotation = rotation
                            
                        }
                    }
                
                VStack {
                    Text(number)
                        .font(.system(size: 20))
                        .bold()
                    Text(unit)
                        .font(.system(size: 13))
                }
            }
            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        CirclePanel(number: "6132", unit: "mV", percentage: 0.65, rotation: 310, title: "设备电量")
        CirclePanel(number: "2185", unit: "mV", percentage: 0.3, rotation: 90, title: "太阳能板")
    }
}
