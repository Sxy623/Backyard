//
//  RegisterView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct RegisterView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Image("login_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.55, height: geometry.size.height - 10)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                
                VStack(spacing: 30) {
                    Spacer()

                    // 注册表单
                    VStack(alignment: .leading, spacing: 30) {
                        Image("nong_circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .padding(.bottom, 50)
                        
                        Text("注册智农账号")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brand5)
                        
                        // 用户名输入框
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.gray)
                                .frame(width: 20)
                            TextField("用户名", text: $username)
                                .textFieldStyle(PlainTextFieldStyle())
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                        // 密码输入框
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundStyle(.gray)
                                .frame(width: 20)
                            SecureField("密码", text: $password)
                                .textFieldStyle(PlainTextFieldStyle())
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                        // 确认密码输入框
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundStyle(.gray)
                                .frame(width: 20)
                            SecureField("确认密码", text: $confirmPassword)
                                .textFieldStyle(PlainTextFieldStyle())
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                        // 注册按钮
                        Button(action: register) {
                            Text("注册")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.brand1)
                                .cornerRadius(10)
                        }
                        .disabled(username.isEmpty || password.isEmpty)
                        
                        // 登录链接
                        HStack {
                            Spacer()
                            Text("已经注册过智农账号？")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Button("前往登录") {
                                // ...
                            }
                            .font(.caption)
                            .foregroundStyle(.brand1)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: 300)
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
                .frame(width: geometry.size.width * 0.45)
            }
        }
        .alert("注册失败", isPresented: $showingAlert) {
            Button("确定") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    func register() {
        
    }
}

#Preview {
    RegisterView()
//        .environment(AuthManager())
}
