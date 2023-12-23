//
//  WeatherData.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 23/12/23.
//

import Foundation

struct WeatherData: Decodable {
    let currently: CurrentConditions
    let forecast: [DayConditions]

    // MARK: - Types

    private enum RootCodingKeys: String, CodingKey {
        case currently, daily
    }

    private enum DailyCodingKeys: String, CodingKey {
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(
            keyedBy: RootCodingKeys.self
        )

        currently = try container.decode(
            CurrentConditions.self,
            forKey: .currently
        )

        let forecastContainer = try container.nestedContainer(
            keyedBy: DailyCodingKeys.self,
            forKey: .daily
        )

        forecast = try forecastContainer.decode(
            [DayConditions].self,
            forKey: .data
        )
    }
}

extension WeatherData {
    struct CurrentConditions: Decodable {

        // MARK: - Properties

        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Float
        let temperature: Float

    }
}

extension WeatherData {
    struct DayConditions: Decodable {

          // MARK: - Properties

          let time: Date
          let icon: String
          let summary: String
          let windSpeed: Float
          let temperatureHigh: Float
          let temperatureLow: Float

      }
}
