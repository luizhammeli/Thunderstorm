//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    private let location: Location
    private let weatherService: WeatherService

    @Published var isLoading: Bool = false
    @Published var forecastViewModel: ForecastViewModel = .init(conditions: [])
    @Published var currentConditionsViewModel: CurrentConditionsViewModel = .init(currentConditions: nil)

    var title: String {
        location.name
    }

    init(location: Location, weatherService: WeatherService = WeatherClient()) {
        self.location = location
        self.weatherService = weatherService
        Task {
            await start()
        }
    }

    func start() async {
        do {
            isLoading = true
            let weatherData = try await weatherService.weather(for: location)
            forecastViewModel = ForecastViewModel(conditions: weatherData.forecast)
            currentConditionsViewModel = CurrentConditionsViewModel(currentConditions: weatherData.currently)
            isLoading = false
        } catch {
            print("Error to fetch data \(error.localizedDescription)")
        }
    }
}
