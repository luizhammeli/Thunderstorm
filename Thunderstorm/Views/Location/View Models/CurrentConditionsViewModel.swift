//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct CurrentConditionsViewModel {
    private let currentConditions: WeatherData.CurrentConditions?
    private let formatter = ClearSkyFormatter()

    // MARK: Init

    init(currentConditions: WeatherData.CurrentConditions?) {
        self.currentConditions = currentConditions
    }

    // MARK: - Public API

    var summary: String {
        currentConditions?.summary ?? ""
    }

    var windSpeed: String {
        formatter.formatWindSpeed(currentConditions?.windSpeed ?? 0)
    }

    var temperature: String {
        formatter.formatTemperature(currentConditions?.temperature ?? 0)
    }
}
