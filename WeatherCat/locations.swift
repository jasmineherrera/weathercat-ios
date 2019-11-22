//
//  locations.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation

enum Condition {
    case cloudy
    case sunny
    case rainy
    case windy
    case snowy
}

class Location {
    var place: String
    var temperature: String
    var condition: Condition
    
    init(temperature: String, place: String, condition: Condition) {
        self.temperature = temperature
        self.place = place
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
