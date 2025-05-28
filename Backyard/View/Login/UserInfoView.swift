//
//  UserInfoView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var fullName: String
    let onComplete: () -> Void
    let onBack: () -> Void
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isRegistering = false
    
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

                    VStack(alignment: .leading, spacing: 30) {
                        Image("nong_circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .padding(.bottom, 30)
                        
                        Text("完善个人信息")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brand5)
                        
                        Text("请输入您的真实姓名，这将用于身份验证")
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        // 姓名输入框
                        VStack(alignment: .leading, spacing: 8) {
                            Text("真实姓名")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            HStack {
                                Image(systemName: "person.text.rectangle")
                                    .foregroundStyle(.gray)
                                    .frame(width: 20)
                                TextField("请输入您的真实姓名", text: $fullName)
                                    .textFieldStyle(PlainTextFieldStyle())
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                        
                        // 注册须知
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "checkmark.shield")
                                    .foregroundColor(.green)
                                Text("注册须知")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                InfoRow(icon: "person.badge.shield.checkmark", text: "您的个人信息将被安全保护")
                                InfoRow(icon: "network", text: "加入小院后可参与各项活动")
                                InfoRow(icon: "graduationcap", text: "享受专业的农业技术支持")
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                        
                        // 导航按钮
                        HStack(spacing: 16) {
                            Button(action: onBack) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("上一步")
                                }
                                .font(.headline)
                                .foregroundStyle(.brand1)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.brand1, lineWidth: 1)
                                )
                            }
                            .disabled(isRegistering)
                            
                            Button(action: completeRegistration) {
                                HStack {
                                    if isRegistering {
                                        ProgressView()
                                            .scaleEffect(0.8)
                                            .foregroundColor(.white)
                                    }
                                    Text(isRegistering ? "注册中..." : "完成注册")
                                    if !isRegistering {
                                        Image(systemName: "checkmark")
                                    }
                                }
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isFormValid && !isRegistering ? Color.brand1 : Color.gray.opacity(0.5))
                                .cornerRadius(10)
                            }
                            .disabled(!isFormValid || isRegistering)
                        }
                    }
                    .frame(maxWidth: 350)
                    
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
    
    private var isFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func completeRegistration() {
        guard isFormValid else { return }
        
        // 验证姓名格式
        let trimmedName = fullName.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedName.count < 2 {
            alertMessage = "请输入至少2个字符的姓名"
            showingAlert = true
            return
        }
        
        // 模拟注册过程
        isRegistering = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isRegistering = false
            // 这里将来实现实际的注册逻辑
            onComplete()
        }
    }
}

struct InfoRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 20)
            Text(text)
                .font(.caption)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

#Preview {
    UserInfoView(
        fullName: .constant(""),
        onComplete: {},
        onBack: {}
    )
} 
