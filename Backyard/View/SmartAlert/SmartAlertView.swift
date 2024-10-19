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
    
    let pestAlerts = [powderyMildewAlert, leafMoldAlert]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("智能预警")
                                .font(.system(size: 28))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Text("自动预警/拍照识别，时刻掌握农田异常")
                                .font(.system(size: 16))
                                .foregroundStyle(.black)
                                .opacity(0.6)
                        }
                        
                        Spacer()
                        
                        CameraButton(showImagePicker: $showImagePicker)
                    }
                    
                    HStack(spacing: 20) {
                        ZStack {
                            Image("alert_map")
                                .resizable()
                                .scaledToFill()
                            VStack {
                                Color.white
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .frame(height: 114)
                                    .overlay {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                HStack(spacing: 8) {
                                                    Image(systemName: "exclamationmark.triangle")
                                                        .font(.system(size: 30, weight: .bold))
                                                    Text("当前预警数量")
                                                        .font(.system(size: 20, weight: .semibold))
                                                }
                                                Spacer()
                                                HStack(spacing: 24) {
                                                    Image(systemName: "snow")
                                                        .opacity(0.2)
                                                    Image(systemName: "syringe.fill")
                                                    Image(systemName: "ladybug.fill")
                                                    Image(systemName: "water.waves")
                                                        .opacity(0.2)
                                                    Image(systemName: "camera.macro")
                                                        .opacity(0.2)
                                                }
                                                .font(.system(size: 24, weight: .bold))
                                            }
                                            Spacer()
                                            Text("3")
                                                .font(.system(size: 64, weight: .bold))
                                        }
                                        .padding(20)
                                        .foregroundStyle(Color(hex: 0xDF692E))
                                    }
                                    .padding(12)
                                Spacer()
                            }
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    NavigationLink(destination: EnlargedMapView()) {
                                        Image("MapButton")
                                            .padding(.bottom, 12)
                                            .padding(.trailing, 12)
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(spacing: 20) {
                            NavigationLink(destination: AlertClassTwoView()) {
                                AlertCard(
                                    backgroundColor: Color.Brand._5,
                                    icon: "snow",
                                    title: "极端天气预警",
                                    description: "暂无，安心",
                                    tintColor: Color.Brand._2,
                                    numberOfAlert: 0
                                )
                                .frame(maxWidth: .infinity, minHeight: 210)
                            }
                            
                            NavigationLink(destination: AlertClassOneView( alertCount: pestAlerts.count, alertName: "病害预警", detailedAlerts: pestAlerts)) {
                                AlertCard(
                                    backgroundColor: Color.Brand._2,
                                    icon: "syringe.fill",
                                    title: "病害预警",
                                    description: "2 号试验田（白粉病）/...",
                                    tintColor: Color.Brand._5,
                                    numberOfAlert: 2
                                )
                                .frame(maxWidth: .infinity, minHeight: 162)
                            }
                            NavigationLink(destination: AlertClassTwoView()) {
                                AlertCard(
                                    backgroundColor: Color.Brand._6,
                                    icon: "ladybug.fill",
                                    title: "虫害预警",
                                    description: "2 号试验田（蚜虫）/...",
                                    tintColor: Color.Brand._5,
                                    numberOfAlert: 3
                                )
                                .frame(maxWidth: .infinity, minHeight: 162)
                            }
                        }
                    }
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: AlertClassTwoView()) {
                            AlertCard(
                                backgroundColor: Color.white,
                                icon: "water.waves",
                                title: "水资源",
                                description: "暂无，安心",
                                tintColor: Color.Brand._5,
                                numberOfAlert: 0
                            )
                            .frame(width: .infinity, height: 162)
                        }
                        
                        NavigationLink(destination: AlertClassTwoView()) {
                            AlertCard(
                                backgroundColor: Color.white,
                                icon: "camera.macro",
                                title: "土壤健康",
                                description: "暂无，安心",
                                tintColor: Color.Brand._5,
                                numberOfAlert: 0
                            )
                            .frame(width: .infinity, height: 162)
                        }
                        
                        NavigationLink(destination: MoreAlertView()) {
                            Color.white
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    Text("...")
                                        .font(.system(size: 36))
                                        .foregroundStyle(Color.Brand._5)
                                }
                                .frame(width: 162, height: .infinity)
                        }
                    }
                }
                .padding(79)
                .fullScreenCover(isPresented: $showImagePicker) {
                    ImagePicker(image: .constant(nil), sourceType: .camera)
                }
            }
            .background(Color(hex: 0xFAFAFA))
            //            .sheet(isPresented: $showSheet) {
            //                DataCardDetail()
            //            }
        }
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

