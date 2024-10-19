//
//  AlertClassOneView.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/17.
//

import SwiftUI

struct AlertClassOneView: View {
    @Environment(\.dismiss) var dismiss

    let alertCount: Int
    let alertName: String
    let detailedAlerts: [DetailedAlertCardData]

    var body: some View {
        VStack {
            HStack {
                backButton
                
                Spacer().frame(width: 40)
                
                Text(alertName + "(" + String(alertCount) + ")")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(detailedAlerts, id: \.id) { alert in
                        AlertCardView() // 确保这里的数据类型是正确的
                            .environmentObject(alert)
                            .previewLayout(.sizeThatFits) // 设置预览布局
                    }
                }
                .padding()
            }
            Spacer()
        }
        .background(Color(hex: 0xFAFAFA))
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
    let sampleAlerts = [
        powderyMildewAlert,
        leafMoldAlert
    ]
    AlertClassOneView(alertCount: sampleAlerts.count, alertName: "病害预警", detailedAlerts: sampleAlerts)
}
