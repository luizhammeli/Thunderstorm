//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct CurrentConditionsViewModel {
    private let location: Location
    private let store: Store
    private let currentConditions: WeatherData.CurrentConditions?
    private let formatter = ClearSkyFormatter()

    // MARK: Init

    init(currentConditions: WeatherData.CurrentConditions?, 
         location: Location,
         store: Store
    ) {
        self.currentConditions = currentConditions
        self.location = location
        self.store = store
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

    func delete() {
        try? store.removeLocation(location)
    }
}
