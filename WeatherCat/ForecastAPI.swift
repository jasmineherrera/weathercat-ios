//
//  ForecastAPI.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/8/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation

struct WeatherDes: Codable {
    var name: String
}

struct ForecastCollectionView: Codable {
    var time: Int
    var temp: Double
    var weather: [WeatherDes]
}

struct ForecastAPI: Codable {
    var latitude: String?
    var longitude: String?
    var city: String?
    var units: String
    var temp: Double
    var high_temps: [Double]
    var low_temps: [Double]
    var twelveHR_forecast: [ForecastCollectionView]
}

struct ForecastResponse: Codable {
    var data: ForecastAPI
}
