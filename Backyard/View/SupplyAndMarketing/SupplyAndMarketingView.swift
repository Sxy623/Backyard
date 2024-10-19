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

struct SupplyAndMarketingView_Previews: PreviewProvider {
    static var previews: some View {
        SupplyAndMarketingView()
    }
}
