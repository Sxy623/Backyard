//
//  DataManager.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/17.
//

import Foundation

@Observable
class DataManager {
    var temperature: Double = 25
    var humidity: Double = 48
    var precipitation: Double = 0
    var solarRadiation: Double = 509
    var dewPoint: Double = 10.0
    var wetBulbTemperature: Double = 14.2
    var dryBulbTemperature: Double = 16.75
    var vpd: Double = 0.5
    var leafWetness: Double = 2
    var soilMoisture: Double = 65
}
