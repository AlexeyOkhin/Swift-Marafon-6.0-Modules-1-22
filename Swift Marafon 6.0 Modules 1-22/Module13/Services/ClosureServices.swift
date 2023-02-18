//
//  ClosureServices.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 18.02.2023.
//

import Foundation

struct WeatherClosureService {

    var receivedWeatherHandler: ((WeatherModel) -> Void)?

    func fetchWeather(cityName: String) {
        guard let receivedWeatherHandler = receivedWeatherHandler else { return }
        let weatherModel = WeatherModel(conditionId: 600, cityName: cityName, temperature: -10)
        receivedWeatherHandler(weatherModel)
    }

}
