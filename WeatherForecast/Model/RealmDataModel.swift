//
//  RealmDataModel.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 25.01.2023.
//

import Foundation
import RealmSwift

class RealmDataModel: Object {
    @Persisted
    var name: String = ""

    @Persisted
    var id: Int = 0

    @Persisted
    var coord: RealmCoordinate!

    @Persisted
    var weather: List<RealmWeather>

    @Persisted
    var main: WeatherMain!
}

class RealmCoordinate: Object {
    @Persisted
    var lon: Double = 0.0

    @Persisted
    var lat: Double = 0.0
}


class RealmWeather: Object {
    @Persisted
    var id: Int = 0
    @Persisted
    var main: String = ""
    @Persisted
    var descriptions: String = ""
    @Persisted
    var icon: String = ""

}


class WeatherMain: Object {
    @Persisted
    var temp: Double = 0.0
    @Persisted
    var pressure: Int = 0
    @Persisted
    var humidity: Int = 0
}
