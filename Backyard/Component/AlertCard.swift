//
//  AlertCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import SwiftUI

struct AlertCard: View {
    var backgroundColor: Color
    var icon: String
    var title: String
    var description: String
    var tintColor: Color
    var numberOfAlert: Int
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            ZStack {
                backgroundColor
                if numberOfAlert == 0 {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 154))
                        .foregroundStyle(tintColor)
                        .opacity(0.05)
                        .offset(x: width * 0.5 - 70, y: -height * 0.5 + 50)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                            .foregroundStyle(tintColor)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(title)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(tintColor)
                        
                        if numberOfAlert > 0 {
                            Text(String(numberOfAlert))
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(tintColor)
                                .padding(.leading, 5)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(description)
                            .font(.system(size: 13))
                            .foregroundColor(tintColor)
                            .opacity(0.6)
                        
                        Spacer()
                        
                        if numberOfAlert > 0 {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(tintColor)
                        }
                    }
                    
                }
                .padding(24)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        AlertCard(
            backgroundColor: Color.Brand._5,
            icon: "snow",
            title: "极端天气预警",
            description: "暂无，安心",
            tintColor: Color.Brand._2,
            numberOfAlert: 0
        )
        .frame(width: 332, height: 210)
        
        AlertCard(
            backgroundColor: Color.Brand._2,
            icon: "syringe.fill",
            title: "病害预警",
            description: "2 号试验田（白粉病）/...",
            tintColor: Color.Brand._5,
            numberOfAlert: 2
        )
        .frame(width: 332, height: 162)
    }
}
