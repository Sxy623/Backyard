//
//  DataCardDetail.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/17.
//

import SwiftUI

struct DataCardDetail: View {
    @State private var selectedOption: String = "时" // 默认选中“时”
    
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Image(systemName: "thermometer").frame(width: 28, height: 28).padding(.leading, 239)
                Text("温度").font(.custom("PingFangSC-Semibold", size: 16))
                
                Spacer()
                
                Button(action: {
                    // to do
                        }) {
                            Circle()
                                .fill(Color(hex: 0x7F7F7F))
                                .frame(width: 21, height: 21)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color(hex: 0x3D3D3D))
                                        .frame(width: 12, height: 12)
                                ).padding(.trailing, 12)
                        }
            }.padding(.top, 12)
            
            Divider().background(Color(hex: 0xFFFFFF)).frame(height: 1)
            
            Spacer()
            
            HStack(alignment: .center){
                Text("24°")
                    .font(.custom("SFProDisplay-Bold", size: 34)) // 设置字体为 SF Pro，粗细为 bold
                    .foregroundColor(Color(hex: 0x28781A)) // 设置颜色为 #28781A
                
                VStack{
                    Text("当日最高温：28°\n当日最低温：22°").font(.custom("PingFangSC", size: 14)).foregroundStyle(Color(hex: 0x808080)).opacity(0.55)
                }
                
                Spacer()
                
                HStack(spacing: 0){
                    ForEach(["时", "周", "月"], id: \.self) { option in
                        Button(action: {
                            selectedOption = option // 更新选中选项
                        }) {
                            Text(option)
                                .font(.system(size: 13))
                                    .fontWeight(.semibold)// 设置字体
                                    .frame(width: 35.33, height: 23)
                                    .background(selectedOption == option ? Color(hex: 0xFFFFFF) : Color.clear) // 设置背景颜色
                                .foregroundColor(selectedOption == option ? Color(hex: 0x28781A) : Color.black) // 设置字体颜色
                                .cornerRadius(100) // 设置圆角
                                
                        }
                    }
                }
                .frame(width: 114, height: 29)
                .background(Color(hex: 0xA6A6A6)) // 设置底部背景颜色
                .opacity(0.7)
                .cornerRadius(100) // 整体按钮组的圆角
            }.padding(.leading, 20).padding(.trailing, 20)
            
            Image("DataCardImage").padding(20).aspectRatio(contentMode: .fit)
            
            Spacer()
            
            HStack {
                Text("每日概要").font(.system(size: 16)).fontWeight(.semibold).padding(.leading, 20)
                
                Spacer()
            }
            
            HStack {
                Text("当前的体感温度为24°，今天的体感温度范围为22°至28°。\n今天高温比昨天体感温度高，昨天体感温度范围为22°至27°。").font(.system(size: 16)).frame(width: 501, height: 80).background(Color(hex: 0xF5F5F5)).cornerRadius(8).padding(.leading, 20).padding(.bottom, 20)
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    DataCardDetail()
}
