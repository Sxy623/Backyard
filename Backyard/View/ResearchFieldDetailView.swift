//
//  ResearchFieldDetailView.swift
//  Backyard
//
//  Created by JaeY on 2024/10/18.
//

import SwiftUI

struct ResearchFieldDetailView: View {
    @EnvironmentObject var researchSupportDataManager: ResearchSupportDataManager
    @Binding var showSheet: Bool
    
    var currentResearchItemIdx: Int
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Text("科研报告")
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.bottom, 8)
            .background(.white)
            .zIndex(100)
            
            ScrollView {
                VStack {
                    ZStack {
                        Image("field")
                            .resizable()
                            .frame(height: 320)
                            .overlay {
                                Color.black.opacity(0.65)
                            }
                        
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].fieldName)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                    Spacer()
                                }
                                
                                HStack(spacing: 16) {
                                    Text("作物： \(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].crop)")
                                        .font(.system(size: 13))
                                    
                                    Text("种植于 \(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].plantingTime)")
                                        .font(.system(size: 13))
                                }
                            }
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].fertilizerAmount) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 56)
                                        Text("kg/亩")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                    }
                                    
                                    Text("施肥量")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].soilPH) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 82)
                                    }
                                    
                                    Text("土壤 pH")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].pharmaceuticalCategory) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 110)
                                    }
                                    
                                    Text("药剂品类")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                            }
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].growthHeight) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 56)
                                        Text("cm          ")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                    }
                                    
                                    Text("生长高度")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].leafArea) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 82)
                                        
                                        ZStack(alignment: .topTrailing) {
                                            Text("cm")
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                            
                                            Text("2")
                                                .fontWeight(.semibold)
                                                .font(.system(size: 8))
                                                .offset(x: 6)
                                        }
                                    }
                                    Text("叶面积")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom, spacing: 0) {
                                        TextField(text: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].diseasesLevel) {
                                            EmptyView()
                                        }
                                        .fontWeight(.bold)
                                        .font(.system(size: 36))
                                        .frame(width: 110)
                                        
                                        Text("级")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                            .padding(.leading, -80)
                                    }
                                    
                                    Text("病虫害发生")
                                        .fontWeight(.light)
                                        .font(.system(size: 13))
                                }
                            }
                        }
                        .padding(32)
                        .foregroundStyle(.white)
                    }
                    .frame(height: 320)
                    .cornerRadius(16)
                                        
                    VStack(alignment: .leading, spacing: 16) {
                        Spacer()
                        HStack(alignment: .top) {
                            Text("实验概述：")
                                .font(.system(size: 16))
                                .fontWeight(.light)
                                
                            Text(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].description)
                                .foregroundStyle(.gray)
                                .font(.system(size: 16))
                                .fontWeight(.light)
                        }
                        
                        Divider()
                            .padding(.vertical, 0)
                        
                        HStack {
                            Image(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].participant.avatarName)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].participant.name)
                                    .fontWeight(.medium)
                                    .font(.system(size: 16))
                                
                                Text("实验负责人")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 13))
                            }
                            
                            Spacer()
                            
                            Button {
                                researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].records.append(researchSupportDataManager.records.randomElement()!)
                            } label: {
                                HStack(alignment: .center) {
                                    Image(systemName: "note.text.badge.plus")
                                    
                                    Text("添加记录")
                                }
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                                .frame(width: 128, height: 56)
                                .background(Color.Brand._4)
                                .cornerRadius(16.0)
                            }

                        }
                        .padding(.bottom, 16)
                    }
                    .padding(.horizontal, 32)
                    .frame(height: 207)
                    .background(.white)
                    .clipShape(CustomCorners(corners: [.bottomLeft, .bottomRight], radius: 16))
                    .padding(.top, -64)
                    .zIndex(-1)
                    .padding(.bottom, 16)
                    
                    ForEach(0..<researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].records.count, id: \.self) { idx in
                        DetailRecordView(showSheet: $showSheet, record: $researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].records[idx], idx: researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].records.firstIndex(of: researchSupportDataManager.researchItems[currentResearchItemIdx].fields[researchSupportDataManager.selectedFieldIdx].records[idx])!)
                            .environmentObject(researchSupportDataManager)
                            .padding(.bottom, 16)
                    }
                }
                .padding(.horizontal, 16)
                .shadow(color: .black.opacity(0.1), radius: 16.0)
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding(.top, -48)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    ResearchFieldDetailView(showSheet: .constant(false), currentResearchItemIdx: 0)
        .environmentObject(ResearchSupportDataManager())
}

