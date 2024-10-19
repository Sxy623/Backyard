//
//  SolutionDescriptionCard.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/19.
//

import Foundation
import SwiftUI

struct SolutionDescriptionCard: View {
    var solutionDescriptionData: SolutionDescriptionData

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(solutionDescriptionData.title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    // 在这里处理链接点击
                    if let url = URL(string: solutionDescriptionData.link) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("来源： " + solutionDescriptionData.link)
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                }
            }
            .padding()

            Text(solutionDescriptionData.details)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding()


            Spacer()
        }
        .background(Color(hex: 0xFAFAFA)) // 设置背景颜色为灰色
        .cornerRadius(12) // 设置圆角
        .frame(width: 648)
        .padding()
    }
}

struct SolutionDescriptionCard_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = SolutionDescriptionData(
            title: "解决方案标题",
            link: "https://www.example.com",
            details: "这是关于该解决方案的详细描述。",
            descriptionType: "类型 A" // 示例类型
        )
        
        SolutionDescriptionCard(solutionDescriptionData: sampleData)
            .previewLayout(.sizeThatFits) // 适应预览布局
            .padding()
    }
}
