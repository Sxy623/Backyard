//
//  DetailedAlertCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

//.frame(maxWidth: .infinity, minHeight: 210)

import SwiftUI

struct AlertCardView: View {
    @EnvironmentObject var data: DetailedAlertCardData
    @State private var selectedSolutionType: String = ""
    @State private var showSolutionCard = false

    var body: some View {
        VStack {
            HStack(spacing: 20){
                data.alertImage
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 278, height: 278)
                    .frame(maxWidth: .infinity, minHeight: 278)
                    .cornerRadius(12)
                
                VStack{
                    ZStack(alignment: .topLeading){
                        Image("DetailedAlertNameBackground")
                        
                        VStack(alignment: .leading){
                            HStack(alignment: .top, content: {
                                Text(data.alertName)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 8)
                                
                                Image(systemName: data.isSolved ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .padding(.leading, 189)
                                    .onTapGesture {
                                        data.isSolved.toggle()
                                    }
                            })
                            
                            HStack{
                                Text(data.alertLocation)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 13))
                                    .opacity(0.6)
                                
                                Text(data.alertDate)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 13))
                                    .opacity(0.6)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.top, 16)
                    }
//                    .frame(width: 374, height: 80)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    
                    ZStack(alignment: .topLeading) {
                        Image("DetailedAlertDescriptionBackground")
                        ScrollView {
                            Text(data.alertDescription)
                                .font(.system(size: 14))
                                .foregroundStyle(Color(hex: 0x3C3C43))
                        }
                        .padding(.leading, 16)
                        .padding(.top, 16)
                    }
//                    .frame(width: 374, height: 182)
                    .frame(maxWidth: .infinity, minHeight: 182)
                }
            }
//            .padding(.leading, 24)
//            .padding(.top, 24)
            
            HStack(alignment: .center, spacing: 20, content: {
                IconAndText(icon: "text.book.closed", text: "百科应对方案")
                    .onTapGesture {
                        selectedSolutionType = "百科应对方案"
                        showSolutionCard = true
                    }
                IconAndText(icon: "clock", text: "历史应对方案")
                    .onTapGesture {
                        selectedSolutionType = "历史应对方案"
                        showSolutionCard = true
                    }
                IconAndText(icon: "note.text", text: "本次应对记录")
                    .onTapGesture {
                        selectedSolutionType = "本次应对记录"
                        showSolutionCard = true
                    }
                Text("...")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.Brand._5)
                    .frame(width: 64, height: 64)
                    .background(Color(hex: 0xFAFAFA))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            .frame(maxWidth: .infinity, minHeight: 64)
            .padding(.top, 36)
        }
        .padding()
        .frame(maxWidth: 720, maxHeight: 426)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .sheet(isPresented: $showSolutionCard){
            SolutionCard(selectedButton: selectedSolutionType)
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
                .frame(width: 32, height: 32) // 设置图标大小
                .foregroundStyle(Color.Brand._5) // 图标颜色

            Text(text)
                .font(.system(size: 16))
                .foregroundStyle(Color.Brand._5) // 文本颜色
                .fontWeight(.medium)
                .padding(.leading, 7) // 设置图标与文本之间的间距
        }
        .frame(width: 186.67, height: 64)
        .background(Color(hex: 0xFAFAFA)) // 设置背景颜色
        .cornerRadius(12) // 设置圆角

    }
}

struct AlertCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCardView()
            .environmentObject(powderyMildewAlert)
    }
}

