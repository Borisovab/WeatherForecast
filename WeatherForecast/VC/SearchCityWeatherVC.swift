//
//  SearchCityWeatherViewController.swift
//  WeatherForecast
//
//  Created by Александр Борисов on 24.01.2023.
//

import UIKit

class SearchCityWeatherViewController: UIViewController {

    var weatherData = WeatherData()

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

    lazy var citySearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = Singleton.Names.citySearchBarPlaceholder.rawValue
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchBar.delegate = self
        setupConstraints()
    }
}

extension SearchCityWeatherViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

        DispatchQueue.main.async {

            let session = URLSession.shared

            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(searchBar.text?.replacingOccurrences(of: " ", with: "%20") ?? "")&units=metric&appid=\(Singleton.shared.apiKey)"

            guard let url = URL(string: urlString)
            else { return }

            let task = session.dataTask(with: url) { data, response, error in

                guard let data = data else {
                    return
                }

                do {
                    self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        self.updateSearchView()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }

    }
}
