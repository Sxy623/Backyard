//
//  ResearchSupportCard.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import SwiftUI

struct ResearchSupportCard: View {
    @Binding var researchItem: ResearchItem
    var body: some View {
        ZStack(alignment: .top) {
            ResearchCardShape()
                .fill(LinearGradient(colors: [
                    Color(hex: "F8FFDE"),
                    Color(hex: "E2F2A6"),
                    Color(hex: "D1E87C")
                ], startPoint: .top, endPoint: .bottom))
                .cornerRadius(20)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(researchItem.title)
                        .foregroundStyle(Color.Brand._5)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    HStack(spacing: 16) {
                        Text("试验田 \(researchItem.fieldNumber)")
                            .foregroundStyle(Color.Brand._5)
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        Text("更新于 \(researchItem.lastUpdateTime)")
                            .foregroundStyle(Color.Brand._5)
                            .fontWeight(.light)
                            .font(.system(size: 14))
                    }
                }
                
                Spacer()
                
                HStack(alignment: .top, spacing: -8) {
                    ForEach(researchItem.participants, id: \.id) { p in
                        Image(p.avatarName)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
                
                Button {
                    researchItem.showDetail.toggle()
                } label: {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.title2)
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color.Brand._5)
                        .rotationEffect(researchItem.showDetail ? .degrees(180) : .zero)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 52)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(researchItem.fields, id: \.fieldName) { field in
                        Button {
                            
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "square.grid.2x2.fill")
                                        .font(.title2)
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(Color.Brand._4)
                                        .padding(16)
                                    Spacer()
                                }
                                Spacer()
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(field.fieldName)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.Brand._4)
                                        .font(.system(size: 14))
                                    
                                    Text("\(field.recordCount) 篇记录")
                                        .fontWeight(.light)
                                        .foregroundStyle(Color.Brand._4)
                                        .font(.system(size: 14))
                                }
                                .padding(.leading, 16)
                                .padding(.bottom, 16)
                            }
                        }
                        .frame(width: 180, height: 120)
                        .background(Color(hex: "FFFFFF").opacity(0.6))
                        .cornerRadius(16)
                    }
                }
            }
            .padding(.horizontal, 32)
            .offset(y: 140)
            .opacity(researchItem.showDetail ? 1 : 0)
        }
        .animation(.easeInOut, value: researchItem.showDetail)
    }
}

#Preview {
    ResearchSupportCard(researchItem: .constant(ResearchSupportDataManager().researchItems[0]))
        .frame(width: 772, height: 320)
}
