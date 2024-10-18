//
//  WeatherAlertView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/17.
//

import SwiftUI

struct WeatherAlertView: View {
    @Environment(\.dismiss) var dismiss // 用于返回的环境变量

    var body: some View {
        VStack {
            HStack {
                backButton // 自定义返回按钮
                Spacer() // 将返回按钮放置在左侧
            }
            .padding() // 添加内边距
            
            Spacer()
            
            Text("Weather Alert")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
    }

    private var backButton: some View {
        Button(action: {
            dismiss() // 返回操作
        }) {
            HStack {
                Image(systemName: "chevron.left").foregroundColor(Color(hex: 0x28781A)) // 返回箭头
                Text("智能预警") // 自定义文本
                    .foregroundColor(Color(hex: 0x28781A)) // 自定义颜色
            }
        }
    }
}

#Preview {
    WeatherAlertView()
}

