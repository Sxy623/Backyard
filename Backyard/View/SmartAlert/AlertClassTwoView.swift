//
//  AlertClassTwoView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/17.
//

import SwiftUI

struct AlertClassTwoView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                backButton
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Text("Class Two Alert")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }

    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left").foregroundColor(Color(hex: 0x28781A))
                Text("智能预警")
                    .foregroundColor(Color(hex: 0x28781A))
            }
        }
    }
}

#Preview {
    AlertClassTwoView()
}
