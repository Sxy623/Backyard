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
    
    var threshold: CGFloat = 1133.0
    var sizeS: CGFloat = 178.0
    var sizeM: CGFloat = 376.0
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let midX = geometry.size.width / 2
                let midY = geometry.size.height / 2
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
                                Spacer()
                            } icon: {
                                Image(systemName: "location.circle")
                                    .font(.system(size: 17))
                            }
                            Image(systemName: "chevron.down")
                                .font(.system(size: 17))
                        }
                        .frame(width: 300, height: 28)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .frame(width: width > threshold ? 956 : 772)
                    .padding(.vertical)
                    
                    HStack(spacing: 20) {
                        DataCard(symbol: "sensor", title: "设备信息", data: "DJI_Mavic", details: [])
                            .frame(width: sizeM, height:  sizeM)
                            .onTapGesture {
                                showSheet = true
                            }
                        VStack(spacing: 20) {
                            HStack(spacing: 20) {
                                DataCard(symbol: "thermometer.low", title: "温度", data: "\(String(format: "%.0f", dataManager.temperature))°C", details: [])
                                    .frame(width: sizeS, height:  sizeS)
                                DataCard(symbol: "humidity.fill", title: "湿度", data: "\(String(format: "%.0f", dataManager.humidity))", details: [])
                                    .frame(width: sizeS, height:  sizeS)
                                if width > threshold {
                                    DataCard(symbol: "humidity.fill", title: "降水", data: "\(String(format: "%.0f", dataManager.precipitation))mm", details: [])
                                        .frame(width: sizeS, height:  sizeS)
                                }
                            }
                            HStack(spacing: 20) {
                                DataCard(symbol: "sun.max.fill", title: "太阳辐射", data: "\(String(format: "%.0f", dataManager.solarRadiation)) W/m²", details: [])
                                    .frame(width: sizeM, height:  sizeS)
                                if width > threshold {
                                    DataCard(symbol: "humidity.fill", title: "露点", data: "\(String(format: "%.0f", dataManager.dewPoint))°C", details: [])
                                        .frame(width: sizeS, height:  sizeS)
                                }
                            }
                        }
                    }
                    HStack(spacing: 20) {
                        DataCard(symbol: "thermometer.low", title: "湿球温度", data: "\(String(format: "%.0f", dataManager.wetBulbTemperature))°C", details: [])
                            .frame(width: sizeS, height:  sizeS)
                        DataCard(symbol: "humidity.fill", title: "干球温度", data: "\(String(format: "%.0f", dataManager.dryBulbTemperature))°C", details: [])
                            .frame(width: sizeS, height:  sizeS)
                        DataCard(symbol: "thermometer.low", title: "饱和水汽压差", data: "\(String(format: "%.0f", dataManager.vpd))kPa", details: [])
                            .frame(width: sizeS, height:  sizeS)
                        DataCard(symbol: "humidity.fill", title: "叶面湿度", data: "\(String(format: "%.0f", dataManager.leafWetness))min", details: [])
                            .frame(width: sizeS, height:  sizeS)
                        if width > threshold {
                            DataCard(symbol: "humidity.fill", title: "土壤水分占比", data: "\(String(format: "%.0f", dataManager.soilMoisture))%", details: [])
                                .frame(width: sizeS, height:  sizeS)
                        }
                    }
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
