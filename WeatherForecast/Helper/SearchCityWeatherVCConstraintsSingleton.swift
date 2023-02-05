//
//  SearchCityWeatherVCConstraintsSingleton.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 28.01.2023.
//


import UIKit

class SearchCityWeatherVCConstraintsSingleton {
    private init(){}

    enum CitySearchBar: Int {
        case top = 100
        case leadingTrailing = 30
        case height = 40
    }

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
        case width = 190
    }

    enum IconImage: Int {
        case top = 25
        case leading = 5
        case widthHeight = 70
    }



}
