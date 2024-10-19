//
//  SupplyAndMarketingView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import SwiftUI

struct SupplyAndMarketingView: View {
    @State private var isFruitSelected: Bool = true
    @State private var isVegetableSelected: Bool = true
    @State private var isCerealSelected: Bool = true
    @State private var searchText: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("供销管理")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .padding(.top, 80)
            // Category Selection
            HStack {
                CategoryButton(title: "水果", isSelected: $isFruitSelected)
                CategoryButton(title: "蔬菜", isSelected: $isVegetableSelected)
                CategoryButton(title: "谷类", isSelected: $isCerealSelected)
                Spacer()
                SearchBar(text: $searchText)
            }
            .frame(width: 772)
            .padding(.bottom, 32)
            
            // ScrollView for Cards
            
            let tomatoCard = SupplyCardData(itemName: "番茄", mainCategory: "蔬菜", subCategory: "茄科", imageName: "tomato", soldQuantity: 206, availableQuantity: 106, origin: "2号试验田", soldQuantityFirst: 124, soldQuantitySecond: 64, soldQuantityThird: 18, soldRegionFirst: "浙江", soldRegionSecond: "江苏", soldRegionThird: "上海", pendingPremiumQuantity: 60, pendingGoodQuantity: 31, pendingDefectiveQuantity: 15)
            let appleCard = SupplyCardData(itemName: "苹果", mainCategory: "水果", subCategory: "蔷薇科", imageName: "apple", soldQuantity: 236, availableQuantity: 111, origin: "7号试验田", soldQuantityFirst: 154, soldQuantitySecond: 64, soldQuantityThird: 18, soldRegionFirst: "浙江", soldRegionSecond: "江苏", soldRegionThird: "上海", pendingPremiumQuantity: 60, pendingGoodQuantity: 42, pendingDefectiveQuantity: 9)
            ScrollView {
                VStack(spacing: 16) {
                    if isFruitSelected{
                        SupplyCard(supplyCardData: appleCard)
                    }
                    if isVegetableSelected{
                        SupplyCard(supplyCardData: tomatoCard)
                    }
                    if isCerealSelected{
                        
                    }
                }
                .frame(width: 772)
            }
        }
    }
}

struct CategoryButton: View {
    var title: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(isSelected ? Color(hex: 0x3E6F35) : Color.black)
                Text(title)
                    .foregroundStyle(isSelected ? Color(hex: 0x3E6F35) : Color.black)
            }
            .cornerRadius(8)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass") // 放大镜图标
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField("Search", text: $text)
                .padding(.trailing)
        }
        .frame(width: 361)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

struct IconWithText: View {
    var text: String
    var iconColor: Int
    var body: some View {
            HStack {
                Circle()
                    .fill(Color(hex: UInt(iconColor))) // 圆形背景颜色
                    .frame(width: 12, height: 12) // 圆形图标大小
                
                Text(text)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
            }
    }
}

struct BarChart: View {
    var weight: Int
    var coloredLength: CGFloat
    var color: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(hex: 0xDCDCDC))
                .frame(width: 310, height: 20)
                .cornerRadius(8)
            ZStack(alignment: .trailing) {
                Rectangle()
                    .frame(width: coloredLength, height: 20)
                    .cornerRadius(8)
                    .foregroundStyle(Color(hex: UInt(color)))
                Text("\(weight)kg") // 显示已售数量
                    .foregroundColor(.white)
                    .padding(.trailing, 8)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            
            
        }
    }
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


struct SupplyAndMarketingView_Previews: PreviewProvider {
    static var previews: some View {
        SupplyAndMarketingView()
    }
}
