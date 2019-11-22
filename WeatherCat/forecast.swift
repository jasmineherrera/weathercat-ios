//
//  forecast.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation

enum ForecastCondition {
    case cloudy
    case sunny
    case rainy
    case windy
    case snowy
}

class Forecast {
    var temperature: String
    var condition: ForecastCondition
    
    init(temperature: String, condition: ForecastCondition) {
        self.temperature = temperature
        self.condition = condition
    }
    
    func getConditionString() -> String {
        switch condition {
        case .cloudy:
            return "Clouds"
        case .sunny:
            return "Sun"
        case .rainy:
            return "Rain"
        case .windy:
            return "Wind"
        case .snowy:
            return "Snow"
        }
    }
}
