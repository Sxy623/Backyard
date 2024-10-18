//
//  DetailResearchSupportView.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import SwiftUI

struct DetailResearchSupportView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var currentResearchItemIdx: Int
    
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            EmptyView()
        } content: {
            
        } detail: {
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("科研支持")
                    .foregroundColor(.blue)
            }
        })
    }
}

#Preview {
    DetailResearchSupportView(currentResearchItemIdx: 0)
}
