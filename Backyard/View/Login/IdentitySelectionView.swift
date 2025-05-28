//
//  IdentitySelectionView.swift
//  Backyard
//
//  Created by 沈心逸 on 2025/5/28.
//

import SwiftUI

struct IdentitySelectionView: View {
    @Binding var selectedIdentity: UserIdentity?
    let onNext: () -> Void
    let onBack: () -> Void
    
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
                        
                        Text("选择您的身份")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brand5)
                        
                        Text("请选择您在小院中的身份角色")
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        // 身份选择卡片
                        VStack(spacing: 16) {
                            ForEach(UserIdentity.allCases, id: \.self) { identity in
                                IdentityCard(
                                    identity: identity,
                                    isSelected: selectedIdentity == identity
                                ) {
                                    selectedIdentity = identity
                                }
                            }
                        }
                        
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
                                .background(selectedIdentity != nil ? Color.brand1 : Color.gray.opacity(0.5))
                                .cornerRadius(10)
                            }
                            .disabled(selectedIdentity == nil)
                        }
                    }
                    .frame(maxWidth: 350)
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
                .frame(width: geometry.size.width * 0.45)
            }
        }
    }
}

struct IdentityCard: View {
    let identity: UserIdentity
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                Image(systemName: identity.icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? .brand1 : .gray)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(identity.rawValue)
                        .font(.headline)
                        .foregroundColor(isSelected ? .brand1 : .primary)
                    
                    Text(identity.description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.brand1)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.brand1.opacity(0.1) : Color.gray.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.brand1 : Color.gray.opacity(0.3), lineWidth: isSelected ? 2 : 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    IdentitySelectionView(
        selectedIdentity: .constant(.farmer),
        onNext: {},
        onBack: {}
    )
} 
