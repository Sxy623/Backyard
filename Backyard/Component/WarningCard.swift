//
//  WarningCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/21.
//

import SwiftUI

struct WarningCard: View {
    var warningCount: Int
    var isWeatherAlert: Bool
    var isDiseaseAlert: Bool
    var isPestAlert: Bool
    var isWaterAlert: Bool
    var isSoilAlert: Bool
    
    var body: some View {
        GeometryReader {geometry in
//            let width = geometry.size.width
//            let height = geometry.size.height
            ZStack{
                Color.white
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .center, spacing: 8) {
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .frame(width: 30, height: 41)
                            
                            Text("当前预警数量")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
//                        .padding(.leading, 20)
//                        .padding(.top, 12.5)
                        
                        Spacer()
                        
                        HStack(spacing: 24){
                            Image(systemName: "snow")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .opacity(isWeatherAlert ? 1 : 0.2)
                            Image(systemName: "syringe.fill")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .opacity(isDiseaseAlert ? 1 : 0.2)
                            Image(systemName: "ladybug.fill")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .opacity(isPestAlert ? 1 : 0.2)
                            Image(systemName: "water.waves")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .opacity(isWaterAlert ? 1 : 0.2)
                            Image(systemName: "globe.asia.australia.fill")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(hex: 0xDF692E))
                                .opacity(isSoilAlert ? 1 : 0.2)
                        }
//                        .padding(.leading, 20)
//                        .padding(.bottom, 20)
                    }
                    .padding(20)
                    
                    Spacer()
                    
                    Text("3")
                        .font(.system(size: 64))
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: 0xDF692E))
                        .padding(.trailing, 24)
                        .padding(.top, 8)
                        
                }
            }
            .frame(maxHeight: 114)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    WarningCard(warningCount: 3, isWeatherAlert: false, isDiseaseAlert: true, isPestAlert: true, isWaterAlert: false, isSoilAlert: false)
}
