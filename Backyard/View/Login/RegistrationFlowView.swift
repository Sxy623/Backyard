//
//  RegistrationFlowView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

enum RegistrationStep: CaseIterable {
    case basicInfo
    case identitySelection
    case invitationCode
    case userInfo
    
    var title: String {
        switch self {
        case .basicInfo:
            return "创建账号"
        case .identitySelection:
            return "选择身份"
        case .invitationCode:
            return "输入邀请码"
        case .userInfo:
            return "完善信息"
        }
    }
}

struct RegistrationFlowView: View {
    let onSwitchToLogin: () -> Void
    
    @State private var currentStep: RegistrationStep = .basicInfo
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var selectedIdentity: UserIdentity?
    @State private var invitationCode = ""
    @State private var fullName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // 进度指示器
                ProgressIndicator(currentStep: currentStep)
                    .padding(.top, 20)
                
                // 当前步骤内容
                Group {
                    switch currentStep {
                    case .basicInfo:
                        BasicRegistrationView(
                            username: $username,
                            password: $password,
                            confirmPassword: $confirmPassword,
                            onNext: {
                                withAnimation {
                                    currentStep = .identitySelection
                                }
                            },
                            onSwitchToLogin: onSwitchToLogin
                        )
                    case .identitySelection:
                        IdentitySelectionView(
                            selectedIdentity: $selectedIdentity,
                            onNext: {
                                withAnimation {
                                    currentStep = .invitationCode
                                }
                            },
                            onBack: {
                                withAnimation {
                                    currentStep = .basicInfo
                                }
                            }
                        )
                    case .invitationCode:
                        InvitationCodeView(
                            invitationCode: $invitationCode,
                            onNext: {
                                withAnimation {
                                    currentStep = .userInfo
                                }
                            },
                            onBack: {
                                withAnimation {
                                    currentStep = .identitySelection
                                }
                            }
                        )
                    case .userInfo:
                        UserInfoView(
                            fullName: $fullName,
                            onComplete: {
                                // 完成注册
                                completeRegistration()
                            },
                            onBack: {
                                withAnimation {
                                    currentStep = .invitationCode
                                }
                            }
                        )
                    }
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .move(edge: .leading).combined(with: .opacity)
                ))
            }
            .navigationBarHidden(true)
        }
    }
    
    private func completeRegistration() {
        // 这里将来实现注册逻辑
        print("注册完成:")
        print("用户名: \(username)")
        print("身份: \(selectedIdentity?.rawValue ?? "未选择")")
        print("邀请码: \(invitationCode)")
        print("姓名: \(fullName)")
        
        // 注册成功后返回登录页面
        onSwitchToLogin()
    }
}

struct ProgressIndicator: View {
    let currentStep: RegistrationStep
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(RegistrationStep.allCases.enumerated()), id: \.offset) { index, step in
                VStack(spacing: 8) {
                    Circle()
                        .fill(stepColor(for: step))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Text("\(index + 1)")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(stepNumberColor(for: step))
                        )
                    
                    Text(step.title)
                        .font(.caption2)
                        .foregroundColor(stepTextColor(for: step))
                        .multilineTextAlignment(.center)
                }
                
                if index < RegistrationStep.allCases.count - 1 {
                    Rectangle()
                        .fill(connectionColor(from: step))
                        .frame(height: 2)
                        .frame(maxWidth: 40)
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func stepColor(for step: RegistrationStep) -> Color {
        let currentIndex = RegistrationStep.allCases.firstIndex(of: currentStep) ?? 0
        let stepIndex = RegistrationStep.allCases.firstIndex(of: step) ?? 0
        
        if stepIndex <= currentIndex {
            return .brand1
        } else {
            return Color.gray.opacity(0.3)
        }
    }
    
    private func stepTextColor(for step: RegistrationStep) -> Color {
        let currentIndex = RegistrationStep.allCases.firstIndex(of: currentStep) ?? 0
        let stepIndex = RegistrationStep.allCases.firstIndex(of: step) ?? 0
        
        if stepIndex <= currentIndex {
            return .brand1
        } else {
            return .gray
        }
    }
    
    private func stepNumberColor(for step: RegistrationStep) -> Color {
        let currentIndex = RegistrationStep.allCases.firstIndex(of: currentStep) ?? 0
        let stepIndex = RegistrationStep.allCases.firstIndex(of: step) ?? 0
        
        if stepIndex <= currentIndex {
            return .white
        } else {
            return .gray
        }
    }
    
    private func connectionColor(from step: RegistrationStep) -> Color {
        let currentIndex = RegistrationStep.allCases.firstIndex(of: currentStep) ?? 0
        let stepIndex = RegistrationStep.allCases.firstIndex(of: step) ?? 0
        
        if stepIndex < currentIndex {
            return .brand1
        } else {
            return Color.gray.opacity(0.3)
        }
    }
}

#Preview {
    RegistrationFlowView(onSwitchToLogin: {})
} 
