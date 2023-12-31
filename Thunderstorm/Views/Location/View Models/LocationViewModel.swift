//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    enum State {
        case loading
        case data (ForecastViewModel, CurrentConditionsViewModel)
        case error (String)
    }

    private let location: Location
    private let weatherService: WeatherService
    @Published var state: State = .loading

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
            let weatherData = try await weatherService.weather(for: location)
            state = .data(
                ForecastViewModel(conditions: weatherData.forecast),
                CurrentConditionsViewModel(currentConditions: weatherData.currently)
            )
        } catch {
            print("Error to fetch data \(error.localizedDescription)")
            state = .error(error.localizedDescription)
        }
    }
}
