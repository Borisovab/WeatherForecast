//
//  SearchCityWeatherVC+.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 25.01.2023.
//

import UIKit


extension SearchCityWeatherViewController {

    func updateSearchView() {
        cityName.text = weatherData.name
        weatherCondition.text = DataSource.weatherIDs[weatherData.weather.first?.id ?? 0]
        temp.text = weatherData.main.temp.description + "º"
        iconImage.image = UIImage(named: weatherData.weather.first?.icon ?? "")
    }



    
}
