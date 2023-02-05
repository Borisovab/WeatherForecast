//
//  NetworkMaster.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 27.01.2023.
//

import Foundation

struct NetworkWeatherManager {

    func fetchWeather(latitude: Double, logntitude: Double, completionHandler: @escaping (WeatherData) -> Void) {
        DispatchQueue.main.async {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(logntitude.description)&units=metric&lang=ru&appid=\(Singleton.shared.apiKey)"
            guard let url = URL(string: urlString)
            else { return }

            let session = URLSession.shared

            let task = session.dataTask(with: url) { (data, response, error) in
                guard let data = data
                else { return }

                if let weather = self.parseJSON(withData: data) {
                    completionHandler(weather)
                }
            }
            task.resume()
        }
    }

    func parseJSON(withData data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            let weather = try decoder.decode(WeatherData.self, from: data)
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
