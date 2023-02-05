//
//  ViewController+Location.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 28.01.2023.
//

import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    
    // функция обновления местоположения
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let lastLocation = locations.last {
            self.networkWeatherManager.fetchWeather(latitude: lastLocation.coordinate.latitude, logntitude: lastLocation.coordinate.longitude) { post in

                DispatchQueue.main.async {[weak self] in
                    guard let self = self
                    else { return }

                    self.databaseWeatherManager.deleteData()
                    self.databaseWeatherManager.saveData(from: post)
                    self.renderData()

                }
            }
        }
    }
}
