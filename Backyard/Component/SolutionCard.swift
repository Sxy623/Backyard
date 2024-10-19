//
//  SolutionCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/19.
//

import Foundation
import SwiftUI

struct SolutionCard: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedButton: String
    @ObservedObject var solutionDescriptionDataManager = SolutionDescriptionDataManager()

    var body: some View {
        VStack {
            // Top Bar
            HStack {
                backButton
                Spacer()
                Text("7 号预警：白粉病")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.Brand._5)
                Spacer()
                Image(systemName: "note.text.badge.plus") // 右上角图标
                    .foregroundStyle(Color.Brand._1)
                    .frame(width: 27)
            }
            .padding()
            .background(Color.white)
            
            Divider() // 分割线
            
            // Main Content
            HStack(spacing: 20) {
                // Left Side: Vertical Buttons
                VStack(spacing: 16) {
                    Button(action: {
                        selectedButton = "百科应对方案"
                    }) {
                        if selectedButton == "百科应对方案"{
                            ChosenIconAndText(icon: "text.book.closed", text: "百科应对方案")
                        }else{
                            IconAndText(icon: "text.book.closed", text: "百科应对方案")
                        }
                    }
                    Button(action: {
                        selectedButton = "历史应对方案"
                    }) {
                        if selectedButton == "历史应对方案"{
                            ChosenIconAndText(icon: "clock", text: "历史应对方案")
                        }else{
                            IconAndText(icon: "clock", text: "历史应对方案")
                        }
                    }
                    Button(action: {
                        selectedButton = "本次应对记录"
                    }) {
                        if selectedButton == "本次应对记录"{
                            ChosenIconAndText(icon: "note.text", text: "本次应对记录")
                        }else{
                            IconAndText(icon: "note.text", text: "本次应对记录")
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: 184)
                //.padding(.leading, -300)
                //.padding(.trailing)
                
                Divider() // 分割线

                // Right Side: ScrollView
                let descriptions = solutionDescriptionDataManager.solutionDescriptions.filter{
                    $0.descriptionType == selectedButton
                }
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(descriptions, id: \.title) { description in
                            SolutionDescriptionCard(solutionDescriptionData: description)
                        }
                        
                        if descriptions.count == 0{
                            Text("暂无记录")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.gray)
                                .background(Color(hex: 0xFAFAFA)) // 设置背景颜色为灰色
                                .cornerRadius(12) // 设置圆角
                                .frame(width: 648)
                                .padding()
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(13)
        .shadow(radius: 5)
        .frame(width: 912)
        .padding()
    }

    private var backButton: some View {
        Button(action: {
            dismiss() // 返回上一视图
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundStyle(Color.Brand._1)
                Text("病害预警")
                    .foregroundStyle(Color.Brand._1)
                    .font(.system(size: 16))
            }
        }
    }
}

private struct IconAndText: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon) // 替换为您想要的图标
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25) // 设置图标大小
                .foregroundStyle(Color.Brand._5) // 图标颜色

            Text(text)
                .font(.system(size: 16))
                .foregroundStyle(Color.Brand._5) // 文本颜色
                .fontWeight(.medium)
                .padding(.leading, 2) // 设置图标与文本之间的间距
        }
        .frame(width: 186.67, height: 64)
        .background(Color(hex: 0xFAFAFA)) // 设置背景颜色
        .cornerRadius(12) // 设置圆角
    }
}

private struct ChosenIconAndText: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon) // 替换为您想要的图标
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25) // 设置图标大小
                .foregroundStyle(Color.white) // 图标颜色

            Text(text)
                .font(.system(size: 16))
                .foregroundStyle(Color.white) // 文本颜色
                .fontWeight(.medium)
                .padding(.leading, 2) // 设置图标与文本之间的间距
        }
        .frame(width: 186.67, height: 64)
        .background(Color.Brand._5) // 设置背景颜色
        .cornerRadius(12) // 设置圆角
    }
}

struct SolutionCard_Previews: PreviewProvider {
    static var previews: some View {
        SolutionCard(selectedButton: "百科应对方案") // 传入初始值 1
    }
}
