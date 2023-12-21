//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    // MARK: - Properties

    private let forecastDate: Date

    // MARK: -

    private let dateFormatter = DateFormatter()

    var id: UUID {
        UUID()
    }

    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: forecastDate).capitalized
    }

    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: forecastDate).capitalized
    }

    var imageName: String {
        "sun.max"
    }

    var summary: String {
        "Clear"
    }

    var windSpeed: String {
        let windSpeed = Int.random(in: 0...30)
        return "\(windSpeed) mi/h"
    }

    var lowTemperature: String {
        let temperature = Int.random(in: 50...70)
        return "\(temperature) °F"
    }

    var highTemperature: String {
        let temperature = Int.random(in: 70...90)
        return "\(temperature) °F"
    }

    var temperature: String {
        return "\(lowTemperature) - \(highTemperature)"
    }

    // MARK: Init

    init(forecastDate: Date) {
        self.forecastDate = forecastDate
    }
}
