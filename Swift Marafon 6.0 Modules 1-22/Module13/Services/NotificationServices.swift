//
//  NotificationServices.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 18.02.2023.
//

import Foundation

extension Notification.Name {
    static let didReceiveWeather = Notification.Name("didReceiveWeather")
}

struct WeatherNotificationService {

    func fetchWeather(cityName: String) {
        let weatherModel = WeatherModel(conditionId: 200, cityName: cityName, temperature: 22)
        let data = ["currentWeather": weatherModel]
        NotificationCenter.default.post(name: .didReceiveWeather, object: self, userInfo: data)
    }
}
