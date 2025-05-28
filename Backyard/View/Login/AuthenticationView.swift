//
//  AuthenticationView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var isShowingLogin = true
    
    var body: some View {
        Group {
            if isShowingLogin {
                LoginView(onSwitchToRegister: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingLogin = false
                    }
                })
            } else {
                RegistrationFlowView(onSwitchToLogin: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingLogin = true
                    }
                })
            }
        }
    }
}

#Preview {
    AuthenticationView()
} 
