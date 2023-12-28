//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import Foundation

@MainActor
class LocationCellViewModel: Identifiable, ObservableObject {
    // MARK: - Properties
    
    private let location: Location
    private let weatherService: WeatherService

    @Published var weatherData: WeatherData?

    init(
        location: Location,
        weatherService: WeatherService
    ) {
        self.location = location
        self.weatherService = weatherService
        Task {
            await start()
        }
    }
    
    // MARK: -

    private let measurementFormatter = ClearSkyFormatter()

    var locationViewModel: LocationViewModel {
        LocationViewModel(location: location, weatherData: weatherData)
    }

    var locationName: String {
        self.location.name
    }

    var locationCountry: String {
        self.location.country
    }

    var summary: String? {
        weatherData?.currently.summary
    }

    var windSpeed: String? {
        guard let windSpeed = weatherData?.currently.windSpeed else { return nil }

        return measurementFormatter.formatWindSpeed(windSpeed)
    }

    var temperature: String? {
        guard let temperature = weatherData?.currently.temperature else { return nil }

        return measurementFormatter.formatTemperature(temperature)

    }

    func start() async {
        do {
            self.weatherData = try await weatherService.weather(for: location)
        } catch {
            print("Error to fetch Weather Data \(error.localizedDescription)")
        }
    }
}
