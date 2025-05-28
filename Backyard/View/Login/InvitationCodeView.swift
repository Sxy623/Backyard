//
//  InvitationCodeView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct InvitationCodeView: View {
    @Binding var invitationCode: String
    let onNext: () -> Void
    let onBack: () -> Void
    
    @State private var codeDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
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
                        
                        Text("输入邀请码")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brand5)
                        
                        Text("请输入小院提供的6位邀请码")
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        // 邀请码输入框
                        HStack(spacing: 12) {
                            ForEach(0..<6, id: \.self) { index in
                                TextField("", text: $codeDigits[index])
                                    .frame(width: 40, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.1))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(focusedField == index ? Color.brand1 : Color.gray.opacity(0.3), lineWidth: focusedField == index ? 2 : 1)
                                            )
                                    )
                                    .focused($focusedField, equals: index)
                                    .onChange(of: codeDigits[index]) { oldValue, newValue in
                                        handleCodeInput(at: index, oldValue: oldValue, newValue: newValue)
                                    }
                                    .onTapGesture {
                                        focusedField = index
                                    }
                            }
                        }
                        .padding(.vertical, 20)
                        
                        // 提示信息
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                            Text("请联系小院管理员获取邀请码")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                        
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
                            
                            Button(action: onNext) {
                                HStack {
                                    Text("下一步")
                                    Image(systemName: "chevron.right")
                                }
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isCodeComplete ? Color.brand1 : Color.gray.opacity(0.5))
                                .cornerRadius(10)
                            }
                            .disabled(!isCodeComplete)
                        }
                    }
                    .frame(maxWidth: 350)
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
                .frame(width: geometry.size.width * 0.45)
            }
        }
        .onAppear {
            focusedField = 0
        }
    }
    
    private var isCodeComplete: Bool {
        codeDigits.allSatisfy { !$0.isEmpty }
    }
    
    private func handleCodeInput(at index: Int, oldValue: String, newValue: String) {
        // 只允许数字和字母
        let filtered = newValue.filter { $0.isLetter || $0.isNumber }
        
        if filtered.count > 1 {
            // 如果粘贴了多个字符，分配到各个输入框
            let characters = Array(filtered.prefix(6))
            for (i, char) in characters.enumerated() {
                if i + index < 6 {
                    codeDigits[i + index] = String(char).uppercased()
                }
            }
            // 移动焦点到下一个空的输入框或最后一个
            let nextIndex = min(index + characters.count, 5)
            focusedField = nextIndex
        } else if filtered.count == 1 {
            // 单个字符输入
            codeDigits[index] = filtered.uppercased()
            // 自动移动到下一个输入框
            if index < 5 {
                focusedField = index + 1
            }
        } else if newValue.isEmpty && !oldValue.isEmpty {
            // 删除字符
            codeDigits[index] = ""
            // 移动到前一个输入框
            if index > 0 {
                focusedField = index - 1
            }
        }
        
        // 更新绑定的邀请码
        invitationCode = codeDigits.joined()
    }
}

#Preview {
    InvitationCodeView(
        invitationCode: .constant(""),
        onNext: {},
        onBack: {}
    )
} 
