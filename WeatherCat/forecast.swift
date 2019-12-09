//
//  forecast.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation

class Forecast {
    var highTemperature: String
    var lowTemperature: String
    var day: String
    
    init(highTemperature: String, lowTemperature: String, day: String) {
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.day = day
    }
    
}
