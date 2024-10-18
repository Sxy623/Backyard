//
//  DetailedAlertCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/18.
//

import SwiftUI

struct AlertCardView: View {
    @EnvironmentObject var data: DetailedAlertCardData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                data.alertImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 278, height: 278)
                    .cornerRadius(12)
                
                VStack {
                    ZStack(alignment: .topLeading){
                        Image("DetailedAlertNameBackground")
                        
                        VStack(alignment: .leading){
                            HStack(alignment: .top, content: {
                                Text(data.alertName)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 8)
                                
                                Image(systemName: data.isSolved ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .padding(.leading, 189)
                                    .onTapGesture {
                                        data.isSolved.toggle()
                                    }
                            })
                            
                            HStack{
                                Text(data.alertLocation)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 13))
                                    .opacity(0.6)
                                
                                Text(data.alertDate)
                                    .foregroundStyle(Color(hex: 0xCFF07C))
                                    .font(.system(size: 13))
                                    .opacity(0.6)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.top, 16)
                    }
                    .frame(width: 374, height: 80)
                    .padding(.leading, 20)
                    
                    ZStack(alignment: .topLeading) {
                        Image("DetailedAlertDescriptionBackground")
                        
                        ScrollView {
                            Text(data.alertDescription)
                                .font(.system(size: 14))
                                .foregroundStyle(Color(hex: 0x3C3C43))
                        }
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    }
                    .frame(width: 374, height: 182)
                }
            }
            .padding(.leading, 24)
            .padding(.top, 24)
            
            HStack(alignment: .top, content: {
                
            })
            .frame(width: 672, height: 64)
            .padding(.top, 36)
            
        }
        .padding()
        .frame(width: 720, height: 426)
    }
}

struct AlertCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCardView()
            .environmentObject(powderyMildewAlert)
    }
}

