//
//  BasicRegistrationView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct BasicRegistrationView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    let onNext: () -> Void
    let onSwitchToLogin: () -> Void
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Image("login_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.55, height: max(geometry.size.height - 10, 0))
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
                            .padding(.bottom, 30)
                        
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
                                .autocorrectionDisabled()
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
                        
                        // 下一步按钮
                        Button(action: validateAndNext) {
                            Text("下一步")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isFormValid ? Color.brand1 : Color.gray.opacity(0.5))
                                .cornerRadius(10)
                        }
                        .disabled(!isFormValid)
                        
                        // 登录链接
                        HStack {
                            Spacer()
                            Text("已经注册过智农账号？")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Button("前往登录") {
                                onSwitchToLogin()
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
        .alert("输入错误", isPresented: $showingAlert) {
            Button("确定") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private var isFormValid: Bool {
        !username.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    private func validateAndNext() {
        if password != confirmPassword {
            alertMessage = "两次输入的密码不一致"
            showingAlert = true
            return
        }
        
        if password.count < 6 {
            alertMessage = "密码长度至少为6位"
            showingAlert = true
            return
        }
        
        onNext()
    }
}

#Preview {
    BasicRegistrationView(
        username: .constant(""),
        password: .constant(""),
        confirmPassword: .constant(""),
        onNext: {},
        onSwitchToLogin: {}
    )
} 
