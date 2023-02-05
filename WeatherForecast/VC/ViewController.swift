//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 23.01.2023.
//

import UIKit
import CoreLocation
import RealmSwift

class ViewController: UIViewController {

    let networkWeatherManager = NetworkWeatherManager()
    let databaseWeatherManager = DatabaseWeatherManager()

    let locationManager = CLLocationManager()
    let realm = try! Realm()

    var searchCityBatton: UIButton = {
        let button = UIButton()
        button.setTitle(Singleton.Names.searchCityBattonName.rawValue, for: .normal)
        button.titleLabel?.font = Singleton.shared.searchCityBattonFont
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.cornerRadius = Singleton.shared.cornerRadius
        return button
    }()

    var iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    var temp: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Singleton.shared.tempFont
        label.textAlignment = .center
        return label
    }()

    var weatherCondition: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Singleton.shared.weatherConditionFont
        label.textAlignment = .center
        return label
    }()

    var cityName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Singleton.shared.cityNameFont
        label.textAlignment = .center
        return label
    }()

    var backImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: Singleton.Names.backImageName.rawValue)
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        startLocationManager()
        searchCityBattonAction()
    }
}


