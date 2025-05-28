//
//  LoginView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct LoginView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showingRegister = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Image("login_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height - 10)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                
                VStack(spacing: 30) {
                    Spacer()

                    // 登录表单
                    VStack(alignment: .leading, spacing: 30) {
                        Image("nong_circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .padding(.bottom, 50)
                        
                        Text("欢迎来到，智农")
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
                        
                        // 用户协议和隐私政策
                        HStack() {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.brand1)
                                .font(.caption)
                            Text("登录即表示您同意我们的")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Button {
                                // 处理用户协议
                            } label: {
                                Text("用户协议")
                                    .font(.caption)
                                    .foregroundStyle(.black)
                                    .underline()
                            }
                            Text("和")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Button {
                                // 处理隐私政策
                            } label: {
                                Text("隐私政策")
                                    .font(.caption)
                                    .foregroundStyle(.black)
                                    .underline()
                            }
                        }
                        
                        // 登录按钮
                        Button(action: login) {
                            Text("登录")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.brand1)
                                .cornerRadius(10)
                        }
                        .disabled(username.isEmpty || password.isEmpty)
                        
                        // 注册链接
                        HStack {
                            Spacer()
                            Text("还没有智农账号？")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Button("立即注册") {
                                showingRegister = true
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
                .frame(width: geometry.size.width * 0.4)
            }
        }
        .alert("登录失败", isPresented: $showingAlert) {
            Button("确定") { }
        } message: {
            Text(alertMessage)
        }
        .sheet(isPresented: $showingRegister) {
//            RegisterView()
        }
    }
    
    private func login() {
//        if authManager.login(username: username, password: password) {
//            // 登录成功，AuthManager会自动更新认证状态
//        } else {
//            alertMessage = "用户名或密码错误"
//            showingAlert = true
//        }
    }
}

#Preview {
    LoginView()
//        .environment(AuthManager())
}
