//
//  DelegateServices.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 18.02.2023.
//

import Foundation
import CoreLocation

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(_ weatherService: WeatherService, _ weather: WeatherModel)
}

struct WeatherService {
    weak var delegate: WeatherServiceDelegate?

    private let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=4f25da66c378&units=metric&lang=ru")!

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)

    }

    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
        performRequest(with: urlString)

    }

    private func performRequest(with urlString: String) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let weather = self.parseJSON(data) {
                    DispatchQueue.main.async {
                        self.delegate?.didFetchWeather(self, weather)
                    }
                }
            }
        }.resume()

    }

    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        let decodeData = try! decoder.decode(WeatherData.self, from: weatherData)

        let id = decodeData.weather[0].id
        let temp = decodeData.main.temp
        let name = decodeData.name

        let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)

        return weather
    }

}
