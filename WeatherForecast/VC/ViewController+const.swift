//
//  ViewController+const.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 23.01.2023.
//

import Foundation
import SnapKit


extension ViewController {

    func setupConstraints() {
        [backImage, cityName, weatherCondition, temp, iconImage, searchCityBatton].forEach{ box in
            view.addSubview(box)
        }

        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        cityName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(VCConstraintsSingleton.CityName.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(VCConstraintsSingleton.CityName.leadingTrailing.rawValue)
            make.height.equalTo(VCConstraintsSingleton.CityName.height.rawValue)
        }

        weatherCondition.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(VCConstraintsSingleton.WeatherCondition.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(VCConstraintsSingleton.WeatherCondition.leadingTrailing.rawValue)
            make.height.equalTo(VCConstraintsSingleton.WeatherCondition.height.rawValue)
        }

        temp.snp.makeConstraints { make in
            make.top.equalTo(weatherCondition.snp.bottom).offset(VCConstraintsSingleton.Temp.top.rawValue)
            make.centerX.equalToSuperview()
            make.height.equalTo(VCConstraintsSingleton.Temp.height.rawValue)
            make.width.equalTo(VCConstraintsSingleton.Temp.width.rawValue)
        }

        iconImage.snp.makeConstraints { make in
            make.top.equalTo(weatherCondition.snp.bottom).offset(VCConstraintsSingleton.IconImage.top.rawValue)
            make.leading.equalTo(temp.snp.trailing).offset(VCConstraintsSingleton.IconImage.leading.rawValue)
            make.width.height.equalTo(VCConstraintsSingleton.IconImage.widthHeight.rawValue)
        }

        searchCityBatton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(VCConstraintsSingleton.SearchCityBatton.bottom.rawValue)
            make.centerX.equalToSuperview()
            make.width.equalTo(VCConstraintsSingleton.SearchCityBatton.width.rawValue)
            make.height.equalTo(VCConstraintsSingleton.SearchCityBatton.height.rawValue)
        }
    }


}
