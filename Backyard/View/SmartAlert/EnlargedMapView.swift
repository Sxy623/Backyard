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

//                        Image("SoilAlert")
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

struct ToDealCard: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct EnlargedMapView_Previews: PreviewProvider {
    static var previews: some View {
        EnlargedMapView()
    }
}
