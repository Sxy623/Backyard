//
//  DataCard.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct DataCard: View {
    
    var symbol: String? = "thermometer.low"
    var title: String = "温度"
    var data: String = "10.48°C"
    var details: [(desc: String, value: String)] = [
        ("最大值", "14.23"),
        ("最小值", "9.59"),
    ]
    var dataSize: CGFloat = 32.0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                if let symbol = symbol {
                    Image(systemName: symbol)
                        .font(.system(size: 13))
                }
                Text(title)
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                Spacer()
            }
            .foregroundStyle(Color.secondary)
            .padding(.horizontal, 16)
            
            HStack {
                Text(data)
                    .font(.system(size: dataSize))
                    .fontWeight(.medium)
                    .foregroundStyle(Color(hex: 0x1A3F2F))
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
            
            ForEach(details, id: \.desc) { desc, value in
                HStack {
                    Text(desc)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.secondary)
                    Spacer()
                    Text(value)
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    var lightGreen = Color(hex: 0xFDFFF5)
    var darkGreen = Color(hex: 0xD4EEB7)
    
    ZStack {
        LinearGradient(
            gradient: Gradient(colors: [lightGreen, darkGreen]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        
        HStack(spacing: 20) {
            DataCard()
                .frame(width: 376, height:  376)
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    DataCard()
                        .frame(width: 178, height:  178)
                    DataCard()
                        .frame(width: 178, height:  178)
                }
                DataCard()
                    .frame(width: 376, height:  178)
            }
        }
    }
}
