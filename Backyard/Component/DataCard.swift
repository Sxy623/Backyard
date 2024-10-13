//
//  DataCard.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/13.
//

import SwiftUI

struct DataCard: View {
    
    var symbol: String = "sunrise"
    var title: String = "标题"
    var data: String = "0659"
    var details: [(desc: String, value: String)] = [
        ("描述1", "数值"),
        ("描述2", "数值"),
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: symbol)
                    .font(.system(size: 13))
                Text(title)
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                Spacer()
            }
            .foregroundStyle(Color.secondary)
            .padding(.horizontal, 16)
            
            HStack {
                Text(data)
                    .font(.system(size: 32))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
            
            ForEach(details, id: \.desc) { desc, value in
                HStack {
                    Text(desc)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.secondary)
                    Spacer()
                    Text(value)
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    HStack(spacing: 20) {
        DataCard()
            .frame(width: 376, height:  376)
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                DataCard()
                    .frame(width: 178, height:  178)
                DataCard()
                    .frame(width: 178, height:  178)
            }
            DataCard()
                .frame(width: 376, height:  178)
        }
    }
}
