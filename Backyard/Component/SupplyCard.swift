//
//  SupplyCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/19.
//

import SwiftUI

struct SupplyCardData {
    var itemName: String
    var mainCategory: String
    var subCategory: String
    var imageName: String
    var soldQuantity: Int
    var availableQuantity: Int
    var origin: String
    
    // 新增变量
    var soldQuantityFirst: Int
    var soldQuantitySecond: Int
    var soldQuantityThird: Int
    var soldRegionFirst: String
    var soldRegionSecond: String
    var soldRegionThird: String
    var pendingPremiumQuantity: Int
    var pendingGoodQuantity: Int
    var pendingDefectiveQuantity: Int
}

struct SupplyCard: View {
    var supplyCardData: SupplyCardData

    var body: some View {
        VStack {
            // Top Image with Labels
            ZStack(alignment: .topLeading) {
                Image(supplyCardData.imageName) // 使用传入的图片名
                    .resizable()
                    .scaledToFill()
                    .frame(height: 154)
                    .clipped()

                VStack(alignment: .leading) {
                    Text(supplyCardData.itemName)
                        .padding(.top, 39)
                        .padding(.bottom, 8)
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                    Text("\(supplyCardData.mainCategory) | \(supplyCardData.subCategory) | \(supplyCardData.origin)")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                .padding()
                .foregroundColor(.white)
            }

            // Sales Information
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        HStack(alignment: .bottom) {
                            Text("\(supplyCardData.soldQuantity)")
                                .font(.system(size: 36))
                                .fontWeight(.bold)

                            Text("kg")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(hex: 0x3C3C43))
                        }

                        Spacer()

                        Text("已售")
                            .frame(width: 53, height: 26)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundStyle(Color(hex: 0x3E6F35))
                            .background(Color(hex: 0xF8FDEB))
                            .cornerRadius(6)
                    }
                    .frame(width: 310)

                    // Placeholder for Bar Chart
                    BarChart(weight: supplyCardData.soldQuantityFirst, coloredLength: 183, color: 0x3E6F35)
                    BarChart(weight: supplyCardData.soldQuantitySecond, coloredLength: 126, color: 0x8CC544)
                    BarChart(weight: supplyCardData.soldQuantityThird, coloredLength: 63, color: 0xCFF07C)

                    HStack(spacing: 32) { // 设置图标之间的间距
                        IconWithText(text: supplyCardData.soldRegionFirst, iconColor: 0x3E6F35)
                        IconWithText(text: supplyCardData.soldRegionSecond, iconColor: 0x8CC544)
                        IconWithText(text: supplyCardData.soldRegionThird, iconColor: 0xCFF07C)
                    }
                }

                Spacer()

                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        HStack(alignment: .bottom) {
                            Text("\(supplyCardData.availableQuantity)")
                                .font(.system(size: 36))
                                .fontWeight(.bold)

                            Text("kg")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(hex: 0x3C3C43))
                        }

                        Spacer()

                        Text("待售")
                            .frame(width: 53, height: 26)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundStyle(Color(hex: 0xDF692E))
                            .background(Color(hex: 0xDF692E).opacity(0.1))
                            .cornerRadius(6)
                    }
                    .frame(width: 310)

                    BarChart(weight: supplyCardData.pendingPremiumQuantity, coloredLength: 183, color: 0x28781A)
                    BarChart(weight: supplyCardData.pendingGoodQuantity, coloredLength: 126, color: 0xF0BF49)
                    BarChart(weight: supplyCardData.pendingDefectiveQuantity, coloredLength: 63, color: 0xB0390A)

                    HStack(spacing: 32) { // 设置图标之间的间距
                        IconWithText(text: "优品", iconColor: 0x28781A)
                        IconWithText(text: "良品", iconColor: 0xF0BF49)
                        IconWithText(text: "次品", iconColor: 0xB0390A)
                    }
                }
            }
            .padding()

            // Update Date
            Text("更新日期: \(DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none))")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.leading)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .frame(width: 772, height: 477)
    }
}

#Preview {
    let tomatoCard = SupplyCardData(itemName: "番茄", mainCategory: "蔬菜", subCategory: "茄科", imageName: "tomato", soldQuantity: 206, availableQuantity: 106, origin: "2号试验田", soldQuantityFirst: 124, soldQuantitySecond: 64, soldQuantityThird: 18, soldRegionFirst: "浙江", soldRegionSecond: "江苏", soldRegionThird: "上海", pendingPremiumQuantity: 60, pendingGoodQuantity: 31, pendingDefectiveQuantity: 15)
    SupplyCard(supplyCardData: tomatoCard)
}

