//
//  DataMonitoringView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct DataMonitoringView: View {
    
    @Environment(DataManager.self) var dataManager
    @State private var showSheet = false
    
    var lightGreen = Color(hex: 0xFDFFF5)
    var darkGreen = Color(hex: 0xD4EEB7)
    var rainGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x3A842F).opacity(0.6), Color(hex: 0x8CC544).opacity(0.3)]), startPoint: .top, endPoint: .bottom)
    
    var threshold: CGFloat = 1133.0
    var sizeS: CGFloat = 178.0
    var sizeM: CGFloat = 376.0
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                let midX = geometry.size.width / 2
                let midY = geometry.size.height / 2
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [lightGreen, darkGreen]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    Image("wheat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.5, height: height * 0.5)
                        .offset(x: -width * 0.25, y: -height * 0.3)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("农历九月初八")
                                        .font(.system(size: 28))
                                        .fontWeight(.semibold)
                                    Text("寒露已过，霜降将至")
                                        .font(.system(size: 16))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                HStack {
                                    Label {
                                        Text("门头沟黄安坨")
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)
                                            .foregroundStyle(Color(hex: 0x1A3F2F))
                                        Spacer()
                                    } icon: {
                                        Image(systemName: "location.circle")
                                            .font(.system(size: 17))
                                            .foregroundStyle(Color(hex: 0x1A3F2F))
                                    }
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 17))
                                        .foregroundStyle(Color(hex: 0x1A3F2F))
                                }
                                .frame(width: 300, height: 28)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            .frame(width: width > threshold ? 956 : 772)
                            .padding(.vertical)
                            .padding(.top, 100)
                            
                            HStack(spacing: 20) {
                                DataCard(symbol: "sensor", title: "设备信息", data: "黄安坨气象监测仪", details: [], dataSize: 28)
                                    .frame(width: sizeM, height:  sizeM)
                                    .overlay {
                                        ZStack {
                                            Image("device")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 304)
                                                .offset(x: sizeM * 0.2, y: sizeM * 0.1)
                                            VStack(spacing: 30) {
                                                CirclePanel(number: String(format: "%.0f", dataManager.battery), unit: "mV", percentage: 0.65, rotation: 310, title: "设备电量")
                                                CirclePanel(number: String(format: "%.0f", dataManager.solarPanel), unit: "mV", percentage: 0.3, rotation: 90, title: "太阳能板")
                                            }
                                            .offset(x: -sizeM * 0.25, y: sizeM * 0.12)
                                        }
                                    }
                                    .onTapGesture {
                                        showSheet = true
                                    }
                                VStack(spacing: 20) {
                                    HStack(spacing: 20) {
                                        DataCard(
                                            symbol: "thermometer.low",
                                            title: "温度",
                                            data: "\(String(format: "%.2f", dataManager.temperature))°C",
                                            details: [
                                                ("最大值", String(format: "%.2f", dataManager.maxTemperature)),
                                                ("最小值", String(format: "%.2f", dataManager.minTemperature))
                                            ]
                                        )
                                        .frame(width: sizeS, height:  sizeS)
                                        DataCard(
                                            symbol: "humidity.fill",
                                            title: "湿度",
                                            data: "\(String(format: "%.2f", dataManager.humidity))%",
                                            details: [
                                                ("最大值", String(format: "%.2f", dataManager.maxHumidity)),
                                                ("最小值", String(format: "%.2f", dataManager.minHumidity))
                                            ]
                                        )
                                        .frame(width: sizeS, height:  sizeS)
                                        if width > threshold {
                                            DataCard(
                                                symbol: "umbrella.fill", title: "降水",
                                                data: "\(String(format: "%.0f", dataManager.precipitation)) mm",
                                                details: [("总和", "")]
                                            )
                                            .overlay {
                                                Image(systemName: "cloud.rain")
                                                    .font(.system(size: 87))
                                                    .foregroundStyle(rainGradient)
                                                    .offset(x: sizeS * 0.3, y: sizeS * 0.2)
                                            }
                                            .frame(width: sizeS, height:  sizeS)
                                            .clipped()
                                        }
                                    }
                                    HStack(spacing: 20) {
                                        DataCard(
                                            symbol: "sun.max.fill",
                                            title: "太阳辐射",
                                            data: "\(String(format: "%.0f", dataManager.solarRadiation)) W/m²",
                                            details: [("当日平均太阳辐射值", "")]
                                        )
                                        .frame(width: sizeM, height:  sizeS)
                                        .overlay {
                                            Image("solar")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 175, height: 125)
                                                .offset(x: sizeM * 0.2, y: sizeS * 0.2)
                                        }
                                        if width > threshold {
                                            DataCard(
                                                symbol: "drop.degreesign.fill", title: "露点",
                                                data: "\(String(format: "%.1f", dataManager.dewPoint))°C",
                                                details: [("最小值", String(format: "%.1f", dataManager.minDewPoint))
                                                         ]
                                            )
                                            .frame(width: sizeS, height:  sizeS)
                                        }
                                    }
                                }
                            }
                            HStack(spacing: 20) {
                                DataCard(
                                    symbol: "thermometer.snowflake",
                                    title: "湿球温度",
                                    data: "\(String(format: "%.2f", dataManager.wetBulbTemperature))°C",
                                    details: [
                                        ("最大值", String(format: "%.2f", dataManager.maxWetBulbTemperature)),
                                        ("最小值", String(format: "%.2f", dataManager.minWetBulbTemperature))
                                    ]
                                )
                                .frame(width: sizeS, height:  sizeS)
                                DataCard(
                                    symbol: "thermometer.sun",
                                    title: "干球温度",
                                    data: "\(String(format: "%.2f", dataManager.dryBulbTemperature))°C",
                                    details: [
                                        ("最大值", String(format: "%.2f", dataManager.maxDryBulbTemperature)),
                                        ("最小值", String(format: "%.2f", dataManager.minDryBulbTemperature))
                                    ]
                                )
                                .frame(width: sizeS, height:  sizeS)
                                DataCard(
                                    symbol: "timer",
                                    title: "饱和水汽压差",
                                    data: "\(String(format: "%.2f", dataManager.vpd)) kPa",
                                    details: []
                                )
                                .frame(width: sizeS, height:  sizeS)
                                DataCard(
                                    symbol: "leaf.fill",
                                    title: "叶面湿度",
                                    data: "\(String(format: "%.2f", dataManager.leafWetness)) min",
                                    details: [("近24小时平均值", "")]
                                )
                                .frame(width: sizeS, height:  sizeS)
                                if width > threshold {
                                    DataCard(
                                        symbol: "aqi.medium",
                                        title: "土壤水分占比",
                                        data: "\(String(format: "%.2f", dataManager.soilMoisture))%",
                                        details: [("近24小时平均值", "")]
                                    )
                                    .frame(width: sizeS, height:  sizeS)
                                }
                            }
                            if width <= threshold {
                                HStack(spacing: 20) {
                                    DataCard(
                                        symbol: "umbrella.fill", title: "降水",
                                        data: "\(String(format: "%.0f", dataManager.precipitation)) mm",
                                        details: [("总和", "")]
                                    )
                                    .overlay {
                                        Image(systemName: "cloud.rain")
                                            .font(.system(size: 87))
                                            .foregroundStyle(rainGradient)
                                            .offset(x: sizeS * 0.3, y: sizeS * 0.2)
                                    }
                                    .frame(width: sizeS, height:  sizeS)
                                    .clipped()
                                    DataCard(
                                        symbol: "drop.degreesign.fill", title: "露点",
                                        data: "\(String(format: "%.1f", dataManager.dewPoint))°C",
                                        details: [("最小值", String(format: "%.1f", dataManager.minDewPoint))
                                                 ]
                                    )
                                    .frame(width: sizeS, height:  sizeS)
                                    DataCard(
                                        symbol: "aqi.medium",
                                        title: "土壤水分占比",
                                        data: "\(String(format: "%.2f", dataManager.soilMoisture))%",
                                        details: [("近24小时平均值", "")]
                                    )
                                    .frame(width: sizeS, height:  sizeS)
                                    DataCard(symbol: nil, title: "", data: "", details: [])
                                        .frame(width: sizeS, height:  sizeS)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .position(x: midX, y: midY)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // ...
                        }) {
                            Image(systemName: "sensor")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // ...
                        }) {
                            Image(systemName: "map")
                        }
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                DataCardDetail()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    DataMonitoringView()
        .environment(DataManager())
}
