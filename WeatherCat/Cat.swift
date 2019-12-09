//
//  Cat.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/8/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation

struct Wind: Codable {
    var speed: Double
    var dir: String
}

struct Weather: Codable {
    var name: String
}

struct Cat: Codable {
    var latitude: String?
    var longitude: String?
    var city: String?
    var temp: Double
    var humidity: Int
    var wind: Wind
    var weather: [Weather]
    var cat: String
}

struct CatResponse: Codable {
    var data: Cat
}
 
