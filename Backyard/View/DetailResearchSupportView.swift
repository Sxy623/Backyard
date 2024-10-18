//
//  DetailResearchSupportView.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import SwiftUI

struct DetailResearchSupportView: View {
    @State var showSheet = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var researchSupportDataManager: ResearchSupportDataManager
    
    var currentResearchItemIdx: Int {
        didSet {
            researchSupportDataManager.selectedFieldIdx = 0
        }
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            EmptyView()
        } content: {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(researchSupportDataManager.researchItems[currentResearchItemIdx].title)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    
                    HStack(spacing: 16) {
                        Text("试验田 \(researchSupportDataManager.researchItems[currentResearchItemIdx].fieldNumber)")
                        
                        Text("更新于 \(researchSupportDataManager.researchItems[currentResearchItemIdx].lastUpdateTime)")
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.light)
                }
                .padding()
                Divider()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<researchSupportDataManager.researchItems[currentResearchItemIdx].fields.count, id: \.self) { idx in
                            Button {
                                researchSupportDataManager.selectedFieldIdx = idx
                            } label: {
                                VStack(alignment: .leading) {
                                    HStack(alignment: .center) {
                                        Image(systemName: "square.grid.2x2.fill")
                                            .font(.title2)
                                            .frame(width: 32, height: 32)
                                            .foregroundStyle(Color.Brand._4)
                                        Spacer()
                                        
                                        Image(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[idx].participant.avatarName)
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[idx].fieldName)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.Brand._4)
                                            .font(.system(size: 14))
                                        
                                        Text("\(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[idx].recordCount) 篇记录")
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.Brand._4)
                                            .font(.system(size: 14))
                                    }
                                }
                                .padding(16)
                                .frame(height: 120)
                                .background(Color.Brand._6)
                                .cornerRadius(16)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.Brand._4.opacity(0.6), lineWidth: researchSupportDataManager.selectedFieldIdx == idx ? 3 : 0)
                                }
                                .padding(.horizontal)
                            }

                        }
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.top, -80)
            .navigationSplitViewColumnWidth(320)
        } detail: {
            ResearchFieldDetailView(showSheet: $showSheet, currentResearchItemIdx: currentResearchItemIdx)
                .environmentObject(researchSupportDataManager)
            
        }
        .onAppear {
            researchSupportDataManager.selectedFieldIdx = 0
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
            researchSupportDataManager.selectedFieldIdx = 0
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
        .environmentObject(ResearchSupportDataManager())
}
