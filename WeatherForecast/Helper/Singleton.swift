//
//  Singleton.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 28.01.2023.
//

import UIKit


class Singleton {
    static let shared = Singleton()
    private init(){}

    let apiKey = "cd2a7ec223fb50caaa859cc93616a48e"
    let cornerRadius: CGFloat = 20

    let searchCityBattonFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    let tempFont = UIFont.systemFont(ofSize: 40, weight: .heavy)
    let weatherConditionFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    let cityNameFont = UIFont.systemFont(ofSize: 35, weight: .bold)

    enum Names: String {
        case searchCityBattonName = "Click it to find city"
        case backImageName = "backWeather"
        case citySearchBarPlaceholder = "Search..."
    }


}


