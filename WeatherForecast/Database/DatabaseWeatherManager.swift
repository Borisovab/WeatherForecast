//
//  DatabaseWeatherManager.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 28.01.2023.
//

import Foundation
import RealmSwift

struct DatabaseWeatherManager {

    func saveData(from weatherJson: WeatherData) {
        DispatchQueue.main.async {
            do {
                let realm = try! Realm()

                // приводим все данные к postDataModel
                let postDataModel = RealmDataModel()

                // name
                postDataModel.name = weatherJson.name
                // id
                postDataModel.id = weatherJson.id

                let postRealmCoordinate = RealmCoordinate()
                postRealmCoordinate.lat = weatherJson.coord.lat
                postRealmCoordinate.lon = weatherJson.coord.lon

                // элементы из coord (lat и lon)
                postDataModel.coord = postRealmCoordinate

                let postWeatherData: [RealmWeather] = weatherJson.weather.map{ post in
                    let weather = RealmWeather()
                    weather.id = post.id
                    weather.main = post.main
                    weather.descriptions = post.descriptions
                    weather.icon = post.icon
                    return weather
                }

                // элементы из weather (id, main, descriptions и icon)
                postDataModel.weather.append(objectsIn: postWeatherData)

                let postWeatherMain = WeatherMain()
                postWeatherMain.temp = weatherJson.main.temp
                postWeatherMain.pressure = weatherJson.main.pressure
                postWeatherMain.humidity = weatherJson.main.humidity

                // элементы из main (temp, pressure и humidity)
                postDataModel.main = postWeatherMain

                // записываем данные в Realm
                try realm.write({
                    realm.add(postDataModel)
                })

            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // при запуске программы удаляем старые данные, тк место положение может измениться, удаляю все данные.
    func deleteData() {
        let realm = try! Realm()
        realm.beginWrite()
        realm.delete(realm.objects(RealmDataModel.self))
        realm.delete(realm.objects(RealmCoordinate.self))
        realm.delete(realm.objects(RealmWeather.self))
        realm.delete(realm.objects(WeatherMain.self))
        try! realm.commitWrite()
    }
}
