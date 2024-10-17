//
//  ResearchSupportView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct ResearchSupportView: View {
    @ObservedObject var researchSupportDataManager = ResearchSupportDataManager()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("科技支持")
                        .fontWeight(.semibold)
                        .font(.system(size: 28))
                        .padding(.leading, 32)
                    
                    Spacer()
                    
                    
                    HStack {
                        TextField("Search", text: .constant(""))
                            .padding(7)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "microphone.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            )
                            .padding(.horizontal, 16)
                            .frame(width: 360)
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(0..<researchSupportDataManager.researchItems.count, id: \.self) { idx in
                            NavigationLink {
                                DetailResearchSupportView(currentResearchItemIdx: idx)
                            } label: {
                                ResearchSupportCard(researchItem: $researchSupportDataManager.researchItems[idx])
                                    .frame(height: researchSupportDataManager.researchItems[idx].showDetail ? 320 : 170)
                                    .animation(.easeInOut, value: researchSupportDataManager.researchItems[idx].showDetail)
                            }
                            .padding(.leading, 32)
                            .padding(.trailing, researchSupportDataManager.researchItems[idx].showDetail ? 0 : 16)
                            .padding(.bottom, idx == researchSupportDataManager.researchItems.count - 1 ? 0 : -42)
                        }
                    }
                    .animation(.easeInOut, value: researchSupportDataManager.researchItems)
                    .padding(.vertical)
                }
            }
            .padding(.horizontal, 32)
            .navigationTitle(" ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { // 自定义 ToolbarItem
                    Text(" ") // 设置一个空白的 Text，作为占位
                }
            }
        }
    }
}

#Preview {
    ResearchSupportView()
}
