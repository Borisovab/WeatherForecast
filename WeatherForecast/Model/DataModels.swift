//
//  DataModels.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 23.01.2023.
//

import Foundation

struct WeatherData: Decodable {
    var name: String = ""
    var id: Int = 0
    var coord = Coordinate()
    var weather: [Weather] = []
    var main: Main = Main()

}

struct Coordinate: Decodable {
    var lon: Double = 0.0
    var lat: Double = 0.0
}

struct Weather: Decodable {
    var id: Int = 0
    var main: String = ""
    var descriptions: String = ""
    var icon: String = ""


    enum CodingKeys: String, CodingKey {
        case id
        case main
        case descriptions = "description"
        case icon
    }
}

struct Main: Decodable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}


