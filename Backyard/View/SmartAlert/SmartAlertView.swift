//
//  SmartAlertView.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct SmartAlertView: View {
    @State private var showImagePicker = false // 用于控制图片选择器的显示

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

                        Spacer()

                        VStack {
                            NavigationLink(destination: WeatherAlertView()) {
                                Image("WeatherAlert").padding(.bottom, 20)
                            }
                            NavigationLink(destination: DiseaseAlertView()) {
                                Image("DiseaseAlert").padding(.bottom, 20)
                            }
                            NavigationLink(destination: PestAlertView()) {
                                Image("PestAlert").padding(.bottom, 20)
                            }
                        }
                        .padding(.trailing, 79)
                    }
                    .padding(.leading, 79)

                    HStack {
                        NavigationLink(destination: SoilAlertView()) {
                            Image("SoilAlert").padding(.trailing, 20)
                        }
                        NavigationLink(destination: WaterAlertView()) {
                            Image("WaterAlert").padding(.trailing, 20)
                        }
                        NavigationLink(destination: MoreAlertView()) {
                            Image("MoreAlert")
                        }
                    }
                    .padding(.leading, 79)
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

extension Color {
    init(hex: UInt) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0
        )
    }
}

#Preview {
    SmartAlertView()
}
