//
//  NetworkManager.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/8/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import Foundation
import Alamofire

let apiEndpoint = "http://34.74.184.46/api"

class NetworkManager {
    static func getCat(city: String, completion: @escaping (Cat)-> Void) {
        let locationEndpoint = "\(apiEndpoint)/weather?city=\(city)"
        let parameters: [String: Any] = [
            "units": "imperial"
        ]
        Alamofire.request(locationEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let catData = try? jsonDecoder.decode(CatResponse.self, from: data) {
                    let cats = catData.data
                    completion(cats)
                } else {
                    print("Failed to decode")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func getForecast(city: String, completion: @escaping (ForecastAPI) -> Void) {
        let locationEndpoint = "\(apiEndpoint)/forecast?city=\(city)"
       // let dateFormatter = DateFormatter()
       // dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       // let date = Date()
       // let dateString = dateFormatter.string(from: date)
        let parameters: [String: Any] = [
            "units": "imperial"
            //"local_time": dateString
        ]
        Alamofire.request(locationEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let forecastData = try? jsonDecoder.decode(ForecastResponse.self, from: data) {
                    let forecasts = forecastData.data
                    completion(forecasts)
                } else {
                    print("Failed to decode")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
