//
//  SearchCityWeatherVC+const.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 24.01.2023.
//

import UIKit
import SnapKit

extension SearchCityWeatherViewController {
    
    func setupConstraints() {
        [backImage, citySearchBar, cityName, weatherCondition, temp, iconImage].forEach{ box in
            view.addSubview(box)
        }

        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        citySearchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(SearchCityWeatherVCConstraintsSingleton.CitySearchBar.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(SearchCityWeatherVCConstraintsSingleton.CitySearchBar.leadingTrailing.rawValue)
            make.height.equalTo(SearchCityWeatherVCConstraintsSingleton.CitySearchBar.height.rawValue)
        }

        cityName.snp.makeConstraints { make in
            make.top.equalTo(citySearchBar.snp.bottom).offset(SearchCityWeatherVCConstraintsSingleton.CityName.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(SearchCityWeatherVCConstraintsSingleton.CityName.leadingTrailing.rawValue)
            make.height.equalTo(SearchCityWeatherVCConstraintsSingleton.CityName.height.rawValue)
        }

        weatherCondition.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(SearchCityWeatherVCConstraintsSingleton.WeatherCondition.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(SearchCityWeatherVCConstraintsSingleton.WeatherCondition.leadingTrailing.rawValue)
            make.height.equalTo(SearchCityWeatherVCConstraintsSingleton.WeatherCondition.height.rawValue)
        }

        temp.snp.makeConstraints { make in
            make.top.equalTo(weatherCondition.snp.bottom).offset(SearchCityWeatherVCConstraintsSingleton.Temp.top.rawValue)
            make.centerX.equalToSuperview()
            make.height.equalTo(SearchCityWeatherVCConstraintsSingleton.Temp.height.rawValue)
            make.width.equalTo(SearchCityWeatherVCConstraintsSingleton.Temp.width.rawValue)
        }

        iconImage.snp.makeConstraints { make in
            make.top.equalTo(weatherCondition.snp.bottom).offset(SearchCityWeatherVCConstraintsSingleton.IconImage.top.rawValue)
            make.leading.equalTo(temp.snp.trailing).offset(SearchCityWeatherVCConstraintsSingleton.IconImage.leading.rawValue)
            make.width.height.equalTo(SearchCityWeatherVCConstraintsSingleton.IconImage.widthHeight.rawValue)
        }
    }
}

