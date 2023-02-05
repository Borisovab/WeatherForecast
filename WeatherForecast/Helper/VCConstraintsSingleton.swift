//
//  VCConstraintsSingleton.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 28.01.2023.
//

import UIKit

class VCConstraintsSingleton {
    private init(){}

    enum CityName: Int {
        case top = 150
        case leadingTrailing = 10
        case height = 50
    }

    enum WeatherCondition: Int {
        case top = 5
        case leadingTrailing = 10
        case height = 30
    }

    enum Temp: Int {
        case top = 25
        case height = 70
        case width = 150
    }

    enum IconImage: Int {
        case top = 25
        case leading = 5
        case widthHeight = 70
    }

    enum SearchCityBatton: Int {
        case bottom = -200
        case width = 250
        case height = 60
    }

}
