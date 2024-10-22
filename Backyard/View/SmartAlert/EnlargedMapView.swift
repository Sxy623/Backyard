//
//  EnlargedMapView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/17.
//

import SwiftUI
import MapKit

struct EnlargedMapView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // 背景图像
            Image("EnlargedMap")
            
            // 地图视图 (可以根据需要添加)
            // Map(position: $cameraPosition) // 假设您有一个地图视图
            
            // 左上角的纵向排列组件
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        WarningCard(warningCount: 3, isWeatherAlert: false, isDiseaseAlert: true, isPestAlert: true, isWaterAlert: false, isSoilAlert: false)
                            .frame(maxWidth: 394, maxHeight: 114)

                        AlertsToSolve()
                    }
                    .padding(20)
                    Spacer()
                }
                Spacer()
            }
            .padding()

            // 右上角的纵向排列按钮
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        Button(action: {
                            // 按钮 1 的动作
                        }) {
                            Image(systemName: "location")
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.black)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }

                        Button(action: {
                            // 按钮 2 的动作
                        }) {
                            Image(systemName: "square.3.layers.3d")
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.black)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }
                    .padding(20)
                }
                Spacer()
            }

            // 右下角的横向排列按钮
            VStack {
                Spacer()
                HStack(spacing: 12) {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Text("完成")
                            .padding()
                            .frame(width: 72, height: 50)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                    }

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.up.right.and.arrow.down.left")
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color.black)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }
                .padding(20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AlertsToSolve: View {
    var body: some View {
        ZStack{
            Color.white
            
            VStack{
                HStack{
                    Text("待处理预警")
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 16)
                    
                    Spacer()
                }
                
                ScrollView{
                    AlertToSolve(alertName: "7 号预警：白粉病", isSolved: false, alertLocation: "2号试验田", alertDate: "2024.10.06")
                    AlertToSolve(alertName: "6 号预警：蚜虫", isSolved: false, alertLocation: "3号试验田", alertDate: "2024.10.03")
                    AlertToSolve(alertName: "5 号预警：棉铃虫", isSolved: false, alertLocation: "7号试验田", alertDate: "2024.09.25")
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Text("一键推送通知")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.Brand._2)
                    .frame(maxWidth: .infinity, maxHeight: 50,alignment: .center)
                    .background(Color.Brand._5)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
            }
        }
        .frame(width: 396, height: 406)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct AlertToSolve:View {
    var alertName: String
    @State var isSolved: Bool
    var alertLocation: String
    var alertDate: String
    
    var body: some View {

        ZStack{
            Color(hex: 0xF5F5F5)
            
            VStack(alignment: .leading){
                HStack(alignment: .top, content: {
                    Text(alertName)
                        .foregroundStyle(Color.Brand._5)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: isSolved ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(Color.Brand._5)
                        .frame(maxWidth: 19.94)
                        .onTapGesture {
                            isSolved.toggle()
                        }
                        
                })
//                .padding(16)
                
                HStack{
                    Text(alertLocation)
                        .foregroundStyle(Color.Brand._5)
                        .font(.system(size: 13))
                        .opacity(0.6)
                    
                    Text(alertDate)
                        .foregroundStyle(Color.Brand._5)
                        .font(.system(size: 13))
                        .opacity(0.6)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        //.frame(maxWidth: .infinity, maxHeight: 120)
    }
}

#Preview{
    AlertToSolve(alertName: "7号预警： 白粉病", isSolved: false, alertLocation: "2号试验田", alertDate: "2024.5.10")
}

#Preview{
    AlertsToSolve()
}

struct EnlargedMapView_Previews: PreviewProvider {
    static var previews: some View {
        EnlargedMapView()
    }
}
