//
//  ResearchSupportDataManager.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import Foundation

struct ResearchField: Equatable {
    var fieldName: String
    var recordCount: Int
    
}

struct ResearchItem: Equatable {
    var title: String
    var fieldNumber: Int
    var lastUpdateTime: String
    var participants: [String]
    
    var showDetail: Bool
    
    var fields: [ResearchField]
}

class ResearchSupportDataManager: ObservableObject {
    @Published var researchItems: [ResearchItem] = [
        ResearchItem(title: "苹果蚜虫综合治理与生态平衡研究", fieldNumber: 4, lastUpdateTime: "2024.10.06", participants: ["person_1", "person_2", "person_3", "person_4"], showDetail: true, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6),
            ResearchField(fieldName: "2 号试验田", recordCount: 6),
            ResearchField(fieldName: "3 号试验田", recordCount: 6),
            ResearchField(fieldName: "4 号试验田", recordCount: 6),
        ]),
        ResearchItem(title: "苹果树白粉病抗性品种选育与栽培技术优化", fieldNumber: 6, lastUpdateTime: "2024.10.06", participants: ["person_3", "person_4"], showDetail: false, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6),
            ResearchField(fieldName: "2 号试验田", recordCount: 6),
            ResearchField(fieldName: "3 号试验田", recordCount: 6),
            ResearchField(fieldName: "4 号试验田", recordCount: 6),
            ResearchField(fieldName: "5 号试验田", recordCount: 6),
            ResearchField(fieldName: "6 号试验田", recordCount: 6)
        ]),
        ResearchItem(title: "土壤类型对果树生长的影响", fieldNumber: 2, lastUpdateTime: "2024.10.06", participants: ["person_4"], showDetail: false, fields: [
            
        ]),
        ResearchItem(title: "气候变化与水稻病害关系", fieldNumber: 3, lastUpdateTime: "2024.10.06", participants: ["person_2", "person_3", "person_4"], showDetail: false, fields: [
            
        ]),
    ]
}
