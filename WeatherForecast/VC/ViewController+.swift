//
//  ViewController+.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 23.01.2023.
//

import UIKit
import CoreLocation
import RealmSwift
//import SwiftUI

extension ViewController {

    func startLocationManager() {
        //запрос авторизации
        locationManager.requestWhenInUseAuthorization()

        // проверка включена ли геолокация
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self

            // точность местополоджения
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

            // когда нет перемещений, приложение может самостоятельно отключать определение местополоджения в целях экономии ресурсов. (в этом приложении отключаю)
            locationManager.pausesLocationUpdatesAutomatically = false

            // после этой команды запускается слижение за местоположением
            locationManager.startUpdatingLocation()
        }
    }

    // кнопка перехода
    func searchCityBattonAction() {
        searchCityBatton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
    }

    @objc private func pressButton() {
        let searchVC = SearchCityWeatherViewController()
        present(searchVC, animated: true)
    }

    // достаю объекты из БД и записываю в UI
    func renderData() {
        let weatherObjects = realm.objects(RealmDataModel.self)
        DispatchQueue.main.async {

            for dataModel in weatherObjects {
                self.cityName.text = dataModel.name
                self.weatherCondition.text = DataSource.weatherIDs[dataModel.weather.first?.id ?? 0]
                self.temp.text = dataModel.main.temp.description + "º"
                self.iconImage.image = UIImage(named: dataModel.weather.first?.icon ?? "")

            }
        }
    }
}
