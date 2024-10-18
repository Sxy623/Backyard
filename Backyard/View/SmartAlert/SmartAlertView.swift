//
//  SmartAlertView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct SmartAlertView: View {
    @State private var showImagePicker = false // 用于控制图片选择器的显示
    @Environment(\.dismiss) var dismiss // 用于返回的环境变量

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("智能预警")
                                .font(.custom("PingFangSC-Semibold", size: 28))
                                .foregroundStyle(.black)
                            Text("自动预警/拍照识别，时刻掌握农田异常")
                                .font(.custom("PingFangSC", size: 16))
                                .foregroundStyle(.black)
                                .opacity(0.6)
                        }
                        .padding(.leading, 79)
                        .padding(.bottom, 34)

                    Spacer()

                        CameraButton(showImagePicker: $showImagePicker)
                            .padding(.trailing, 83) // 使用新的 CameraButton
                    }

                    HStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing) {
                            ZStack(alignment: .top) {
                                Image("SmartAlertMap")

                                Image("WarningCount")
                                    .padding(.top, 12)
                            }
                            NavigationLink(destination: EnlargedMapView()) {
                                Image("MapButton")
                                    .padding(.bottom, 12)
                                    .padding(.trailing, 12)
                            }
                        }
                        .frame(width: 420, height: 574)
                        .padding(.bottom, 20)
                        
                        Spacer()

                        VStack {
                            NavigationLink(destination: WeatherAlertView()) {
                                AlertCard(backgroundImage: Image("WeatherAlertBackground") , icon: Image(systemName: "snow"), title: "极端天气预警", description: "暂无，安心", iconColor: 0xCFF07C, titleColor: 0xCFF07C, descriptionColor: 0xCFF07C, numberOfAlert: 0)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 332, height: 210)
                                    .padding(.bottom, 20)
                            }
                            NavigationLink(destination: DiseaseAlertView()) {
                                AlertCard(backgroundImage: Image("DiseaseAlertBackground") , icon: Image(systemName: "syringe.fill"), title: "病害预警", description: "2 号试验田（白粉病）/...", iconColor: 0x1A3F2F, titleColor: 0x1A3F2F, descriptionColor: 0x1A3F2F, numberOfAlert: 2)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 332, height: 162)
                            }
                            NavigationLink(destination: PestAlertView()) {
                                AlertCard(backgroundImage: Image("PestAlertBackground") , icon: Image(systemName: "ladybug.fill"), title: "病害预警", description: "2 号试验田（白粉病）/...", iconColor: 0x1A3F2F, titleColor: 0x1A3F2F, descriptionColor: 0x1A3F2F, numberOfAlert: 2)
                                    .previewLayout(.sizeThatFits)
                                    .padding(.top, 20)
                                    .frame(width: 332, height: 162)
                            }
                        }
                        .padding(.trailing, 79)
                        //.frame(width: 772)
                    }
                    .padding(.leading, 79)

                    HStack(alignment: .top) {
                        NavigationLink(destination: WaterAlertView()) {
                            AlertCard(backgroundImage: Image("WaterAlertBackground"), icon: Image(systemName: "water.waves"), title: "水资源", description: "暂无，安心", iconColor: 0x1A3F2F, titleColor: 0x1A3F2F, descriptionColor: 0x1A3F2F, numberOfAlert: 0)
                                .padding(.trailing, 20)
                                //.frame(width: 285, height: 162)
                                //.scaledToFit()
                        }

                        NavigationLink(destination: SoilAlertView()) {
                            AlertCard(backgroundImage: Image("SoilAlertBackground"), icon: Image(systemName: "meditate"), title: "土壤健康", description: "暂无，安心", iconColor: 0x1A3F2F, titleColor: 0x1A3F2F, descriptionColor: 0x1A3F2F, numberOfAlert: 0)
                                //.frame(width: 285, height: 162)
                                //.scaledToFit()
                                //.frame(width: 285, height: 162)
                        }
                        NavigationLink(destination: MoreAlertView()) {
                            Image("MoreAlert")
                                .padding(.leading, 20)
                                .padding(.trailing, 79)
                                //.frame(width: 162, height: 162)
                        }
                    }
//                    .frame(width: 772, height: 162)
                    .padding(.leading, 79)//这里应该是79，但是不知道为什么设置成79的时候并不在正确位置
                    
                }
                .padding(.top, 71)
                .fullScreenCover(isPresented: $showImagePicker) {
                    ImagePicker(image: .constant(nil), sourceType: .camera)
                }
            }
            .background(Color(hex: 0xFAFAFA))
        }
        .navigationViewStyle(.stack)
    }
}

struct CameraButton: View {
    @Binding var showImagePicker: Bool // 用于控制图片选择器的显示

    var body: some View {
        Button(action: {
            print("Showing Image Picker")
            showImagePicker = true // 显示图片选择器
        }) {
            HStack {
                Image(systemName: "camera") // 使用系统照相机图标
                    .foregroundColor(.white)
                Text("异常识别")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding()
            .background(Color(hex: 0x1A3F2F))
            .cornerRadius(12)
            .frame(width: 132, height: 50)
        }
        .padding()
    }
}

#Preview {
    SmartAlertView()
}

