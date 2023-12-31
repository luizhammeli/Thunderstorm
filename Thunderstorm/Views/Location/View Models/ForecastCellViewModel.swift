//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    // MARK: - Properties

    private let dayCondition: WeatherData.DayConditions

    // MARK: -

    private let dateFormatter = DateFormatter()
    private let numberFormatter = ClearSkyFormatter()

    var id: UUID {
        UUID()
    }

    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: dayCondition.time).capitalized
    }

    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: dayCondition.time).capitalized
    }

    var imageName: String {
        switch dayCondition.icon {
        case "clear-day":
            return "sun.max"
        case "clear-night":
            return "moon"
        case "rain":
            return "cloud.rain"
        case "snow":
            return "cloud.snow"
        case "sleet":
            return "cloud.sleet"
        case "wind",
             "cloudy",
             "partly-cloudy-day",
             "partly-cloudy-night":
            return "cloud"
        default:
            return "sun.max"
        }
    }

    var summary: String {
        dayCondition.summary
    }

    var windSpeed: String {
        numberFormatter.formatWindSpeed(dayCondition.windSpeed)

    }

    var lowTemperature: String {
        numberFormatter.formatTemperature(dayCondition.temperatureLow)
    }

    var highTemperature: String {
        numberFormatter.formatTemperature(dayCondition.temperatureHigh)
    }

    var temperature: String {
        return "\(lowTemperature) - \(highTemperature)"
    }

    // MARK: Init

    init(dayCondition: WeatherData.DayConditions) {
        self.dayCondition = dayCondition
    }
}
