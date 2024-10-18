//
//  ResearchSupportDataManager.swift
//  Backyard
//
//  Created by JaeY on 2024/10/17.
//

import Foundation

struct Record: Equatable {
    var id = UUID()
    var content: String
    var recordTime: String
    var reocrdImages: [String]
}

struct ResearchField: Equatable {
    var fieldName: String
    var recordCount: Int
    var participant: Participant
    
    var crop: String
    var plantingTime: String
    
    var fertilizerAmount: String
    var soilPH: String
    var pharmaceuticalCategory: String
    var growthHeight: String
    var leafArea: String
    var diseasesLevel: String
    var description: String
    
    var records: [Record] = []
}

struct Participant: Equatable {
    var id = UUID()
    var avatarName: String
    var name: String
}

struct ResearchItem: Equatable {
    var title: String
    var fieldNumber: Int
    var lastUpdateTime: String
    var participants: [Participant]
    
    var showDetail: Bool
    
    var fields: [ResearchField]
}

class ResearchSupportDataManager: ObservableObject {
    @Published var selectedFieldIdx = 0
    
    @Published var researchItems: [ResearchItem] = [
        ResearchItem(title: "苹果蚜虫综合治理与生态平衡研究", fieldNumber: 4, lastUpdateTime: "2024.10.06", participants: [
            Participant(avatarName: "person_1", name: "夜叉"),
            Participant(avatarName: "person_2", name: "夜叉"),
            Participant(avatarName: "person_3", name: "夜叉"),
            Participant(avatarName: "person_4", name: "夜叉"),
        ], showDetail: true, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6, participant: Participant(avatarName: "person_1", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "2 号试验田", recordCount: 6, participant: Participant(avatarName: "person_2", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "3 号试验田", recordCount: 6, participant: Participant(avatarName: "person_3", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "4 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
        ]),
        ResearchItem(title: "苹果树白粉病抗性品种选育与栽培技术优化", fieldNumber: 6, lastUpdateTime: "2024.10.06", participants: [
            Participant(avatarName: "person_3", name: "夜叉"),
            Participant(avatarName: "person_4", name: "夜叉"),
        ], showDetail: false, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6, participant: Participant(avatarName: "person_3", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "2 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "3 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "4 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "5 号试验田", recordCount: 6, participant: Participant(avatarName: "person_3", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "6 号试验田", recordCount: 6, participant: Participant(avatarName: "person_3", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。")
        ]),
        ResearchItem(title: "土壤类型对果树生长的影响", fieldNumber: 2, lastUpdateTime: "2024.10.06", participants: [
            Participant(avatarName: "person_4", name: "夜叉")
        ], showDetail: false, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
        ]),
        ResearchItem(title: "气候变化与水稻病害关系", fieldNumber: 3, lastUpdateTime: "2024.10.06", participants: [
            Participant(avatarName: "person_2", name: "夜叉"),
            Participant(avatarName: "person_3", name: "夜叉"),
            Participant(avatarName: "person_4", name: "夜叉"),
        ], showDetail: false, fields: [
            ResearchField(fieldName: "1 号试验田", recordCount: 6, participant: Participant(avatarName: "person_2", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "2 号试验田", recordCount: 6, participant: Participant(avatarName: "person_3", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
            ResearchField(fieldName: "3 号试验田", recordCount: 6, participant: Participant(avatarName: "person_4", name: "夜叉"), crop: "苹果", plantingTime: "2024.10.06", fertilizerAmount: "1.0", soilPH: "14.5", pharmaceuticalCategory: "草甘膦", growthHeight: "25", leafArea: "150", diseasesLevel: "1", description: "施肥过程发现轻微病虫害，实施了定期监测和防治措施。"),
        ]),
    ]
    
    @Published var records: [Record] = [
        Record(content:
        """
        天气：阴，气温20℃，湿度60%
        观察内容：
        · 高度：85 cm（较上次增加3 cm）
        · 胸径：2.7 cm
        · 叶片状况：部分叶片有轻微卷曲，可能与湿度有关。
        · 花蕾情况：花蕾开始出现，预计一周内开花。
        · 白粉病情况：发现少量白粉病斑，约5%叶片受影响，病斑为白色粉末状。

        备注：考虑加强通风措施，保持土壤适度干燥，以防病害扩散。
        """
               , recordTime: "2024.10.06", reocrdImages: ["record_1", "record_2", "record_3", "record_4"])
    ]
}
