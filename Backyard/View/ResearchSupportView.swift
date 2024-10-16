//
//  ResearchSupportView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct ResearchSupportView: View {
    
    @State private var selected: String? = nil
    
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            EmptyView()
        } content: {
            List {
                Text("1号实验田")
                    .onTapGesture {
                        selected = "1号实验田"
                    }
                Text("2号实验田")
                    .onTapGesture {
                        selected = "2号实验田"
                    }
            }
        } detail: {
            Text(selected ?? "")
        }
    }
}

#Preview {
    ResearchSupportView()
}
