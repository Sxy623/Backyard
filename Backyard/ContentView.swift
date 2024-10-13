//
//  ContentView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/9.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("sidebarCustomizations") var tabViewCustomization: TabViewCustomization
    @State private var selectedTab: Tabs = .数据监测
    @State var items = ["门头沟黄安坨", "一号实验田", "二号实验田"]
    
    var body: some View {
        TabView {
            Tab(Tabs.数据监测.name, systemImage: Tabs.数据监测.symbol) {
                DataMonitoringView()
            }.customizationID(Tabs.数据监测.customizationID)
            
            Tab(Tabs.智能预警.name, systemImage: Tabs.智能预警.symbol) {
                SmartAlertView()
            }.customizationID(Tabs.智能预警.customizationID)
            
            Tab(Tabs.科研支持.name, systemImage: Tabs.科研支持.symbol) {
                ResearchSupportView()
            }.customizationID(Tabs.科研支持.customizationID)
            
            Tab(Tabs.供销管理.name, systemImage: Tabs.供销管理.symbol) {
                SupplyManagementView()
            }.customizationID(Tabs.供销管理.customizationID)
            
            TabSection("快速访问") {
                ForEach(items, id: \.self) { item in
                    Tab(item, systemImage: "square.grid.2x2") {
                        // ...
                    }
                }
            }
            .defaultVisibility(.hidden, for: .tabBar)
        }
        .tabViewSidebarHeader {
            HStack {
                Text("智农")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
        }
        .tabViewSidebarBottomBar  {
            HStack(spacing: 10) {
                Image("avatar")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .clipShape(Circle())
                Text("沈心逸")
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($tabViewCustomization)
        .background(Color.clear)
    }
}

#Preview {
    ContentView()
}
