//
//  DataManager.swift
//  Backyard
//
//  Created by 沈心逸 on 2024/10/17.
//

import Foundation

@Observable
class DataManager {
    
    var battery: Double = 6132
    var solarPanel: Double = 2185
    
    var temperature: Double = 10.48
    var maxTemperature: Double = 14.23
    var minTemperature: Double = 9.59
    
    var humidity: Double = 68.91
    var maxHumidity: Double = 97.16
    var minHumidity: Double = 65.13
    
    var precipitation: Double = 9
    var solarRadiation: Double = 593
    var dewPoint: Double = 9.6
    var minDewPoint: Double = 9.5
    
    var wetBulbTemperature: Double = 13.89
    var maxWetBulbTemperature: Double = 14.65
    var minWetBulbTemperature: Double = 10.99
    
    var dryBulbTemperature: Double = 16.58
    var maxDryBulbTemperature: Double = 17.91
    var minDryBulbTemperature: Double = 15.08
    
    var vpd: Double = 1.31
    var leafWetness: Double = 3.24
    var soilMoisture: Double = 65.23
}
