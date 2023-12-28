//
//  WeatherPreviewClient.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 28/12/23.
//

import Foundation

final class WeatherPreviewClient: WeatherService {
    func weather(for location: Location) async throws -> WeatherData {
        return WeatherData.preview
    }
}
