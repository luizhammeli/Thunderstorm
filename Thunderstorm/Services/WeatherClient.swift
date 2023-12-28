//
//  WeatherClient.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 24/12/23.
//

import Foundation

final class WeatherClient: WeatherService {
    func weather(for location: Location) async throws -> WeatherData {
        var baseURL = Configuration.clearSkyBaseURL

        let queryItems: [URLQueryItem] = [
            .init(name: "lat", value: "\(location.latitude)"),
            .init(name: "long", value: "\(location.longitude)"),
            .init(name: "api_key", value: Configuration.clearSkyAPIKey),
        ]
        baseURL.append(queryItems: queryItems)

        let request = URLRequest(url: baseURL)

        let (data, _) = try await URLSession.shared.data(for: request)

        return try WeatherDataDecoder().decode(WeatherData.self, from: data)
    }
}
