//
//  AlertCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import SwiftUI

struct AlertCard: View {
    var backgroundImage: Image
    var icon: Image
    var title: String
    var description: String
    var iconColor: Int // 修改为 Int 类型
    var titleColor: Int // 修改为 Int 类型
    var descriptionColor: Int // 修改为 Int 类型
    var numberOfAlert: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {
                ZStack(alignment: .topLeading) {
                    backgroundImage
                        .resizable()
                        .scaledToFill()
                    
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(hex: UInt(iconColor))) // 设置图标颜色
                        .padding(.top, 24)
                        .padding(.leading, 24)
                }
                
                VStack(alignment: .leading) {
                    if numberOfAlert == 0{
                        Text(title)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: UInt(titleColor))) // 设置标题颜色
                            .multilineTextAlignment(.center)
                    }else{
                        Text(title + " " + String(numberOfAlert))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: UInt(titleColor))) // 设置标题颜色
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    Text(description)
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: UInt(descriptionColor))) // 设置描述颜色
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 27)
                .padding(.leading, 24)
            }
            
            if numberOfAlert == 0 {
                Image("NoAlertMark")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.05)
                    .frame(width: 154, height: 154)
                    .padding(.top, -28)
                    .padding(.trailing, -26)
            }
        }
    }
}

struct AlertCard_Previews: PreviewProvider {
    static var previews: some View {
        AlertCard(
            backgroundImage: Image("WeatherAlertBackground"),
            icon: Image(systemName: "snow"),
            title: "警告",
            description: "这是一个说明文字。",
            iconColor: 0xCFF07C, // 使用 Int 类型
            titleColor: 0xCFF07C, // 使用 Int 类型
            descriptionColor: 0xCFF07C,
            numberOfAlert: 0
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .frame(width: 332, height: 210)
    }
}


