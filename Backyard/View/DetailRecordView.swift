//
//  DetailRecordView.swift
//  Backyard
//
//  Created by JaeY on 2024/10/18.
//

import SwiftUI

struct DetailRecordView: View {
    @Binding var showSheet: Bool
    @Binding var record: Record
    var idx: Int
    @EnvironmentObject var researchSupportDataManager: ResearchSupportDataManager
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    VStack {
                        HStack(spacing: 8) {
                            Image(record.reocrdImages[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (geo.size.width - 8) / 2)
                                .frame(height: 240)
                                .cornerRadius(12)
                            
                            VStack(spacing: 8) {
                                Image(record.reocrdImages[1])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (geo.size.width - 8) / 2)
                                    .frame(height: 116)
                                    .cornerRadius(12)
                                
                                HStack(spacing: 8) {
                                    Image(record.reocrdImages[2])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 116)
                                        .frame(width: ((geo.size.width - 8) / 2 - 8) / 2)
                                        .cornerRadius(12)
                                    
                                    Image(record.reocrdImages[3])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: ((geo.size.width - 8) / 2 - 8) / 2)
                                        .frame(height: 116)
                                        .cornerRadius(12)
                                }
                            }
                        }
                        .frame(height: 240)
                        .cornerRadius(12)
                        
                        HStack {
                            Text(record.content)
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(width: geo.size.width, alignment: .leading)
                                .foregroundStyle(.black.opacity(0.75))
                                .font(.system(size: 16))
                        }
                    }
                    .frame(width: geo.size.width)
                }
            }
            .padding([.top, .horizontal], 8)
            
            VStack {
                Divider()
                Spacer()
                HStack(spacing: 16) {
                    Text("#\(idx + 1)")
                        .foregroundStyle(Color.Brand._4)
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                    
                    Text(record.recordTime)
                        .foregroundStyle(.gray)
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 16)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 48)
        }
        .background(.white)
        .frame(height: 530)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 16.0)
    }
}

#Preview {
    DetailRecordView(showSheet: .constant(false), record: .constant(ResearchSupportDataManager().records[0]), idx: 0)
        .environmentObject(ResearchSupportDataManager())
}
