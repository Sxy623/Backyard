//
//  SupplyAndMarketingView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import SwiftUI

struct SupplyAndMarketingView: View {
    @State private var isFruitSelected: Bool = false
    @State private var isVegetableSelected: Bool = false
    @State private var isCerealSelected: Bool = false
    @State private var searchText: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("供销管理")
                .font(.system(size: 28))
                .fontWeight(.semibold)
            // Category Selection
            HStack {
                CategoryButton(title: "水果", isSelected: $isFruitSelected)
                CategoryButton(title: "蔬菜", isSelected: $isVegetableSelected)
                CategoryButton(title: "谷类", isSelected: $isCerealSelected)
                Spacer()
                SearchBar(text: $searchText)
            }
            .frame(width: 772)
            .padding()
            
            // ScrollView for Cards
            ScrollView {
                VStack(spacing: 16) {
                    SupplyCard(itemName: "番茄", mainCategory: "蔬菜", subCategory: "茄科", imageName: "tomato", soldQuantity: 206, availableQuantity: 106, origin: "2号试验田")
                    SupplyCard(itemName: "苹果", mainCategory: "水果", subCategory: "蔷薇科", imageName: "apple", soldQuantity: 236, availableQuantity: 111, origin: "7号试验田")
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
    var itemName: String
    var mainCategory: String
    var subCategory: String
    var imageName: String
    var soldQuantity: Int
    var availableQuantity: Int
    var origin: String

    var body: some View {
        VStack {
            // Top Image with Labels
            ZStack(alignment: .topLeading) {
                Image(imageName) // 使用传入的图片名
                    .resizable()
                    .scaledToFill()
                    .frame(height: 154)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(itemName)
                        .padding(.top, 39)
                        .padding(.bottom, 8)
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                    Text(mainCategory + " | " + subCategory + " | " + origin)
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
                            Text("\(soldQuantity)")
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
                    BarChart(weight: 124, coloredLength: 183, color: 0x3E6F35)
                    BarChart(weight: 64, coloredLength: 126, color: 0x8CC544)
                    BarChart(weight: 64, coloredLength: 63, color: 0xCFF07C)
                    HStack(spacing: 32) { // 设置图标之间的间距
                        IconWithText(text: "浙江", iconColor: 0x3E6F35)
                        IconWithText(text: "江苏", iconColor: 0x8CC544)
                        IconWithText(text: "上海", iconColor: 0xCFF07C)
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        HStack(alignment: .bottom) {
                            Text("\(availableQuantity)")
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
                    BarChart(weight: 60, coloredLength: 183, color: 0x28781A)
                    BarChart(weight: 42, coloredLength: 126, color: 0xF0BF49)
                    BarChart(weight: 9, coloredLength: 63, color: 0xB0390A)
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

struct SupplyAndMarketingView_Previews: PreviewProvider {
    static var previews: some View {
        SupplyAndMarketingView()
    }
}
