//
//  BackyardApp.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/9.
//

import SwiftUI

@main
struct BackyardApp: App {
    
    @State private var dataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(Color.green)
                .environment(dataManager)
        }
    }
}
