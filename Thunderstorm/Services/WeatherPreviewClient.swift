//
//  WeatherPreviewClient.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 28/12/23.
//

import Foundation

final class WeatherPreviewClient: WeatherService {
    private let result: Result<WeatherData, NSError>

    init(result: Result<WeatherData, NSError> = .success(.preview)) {
        self.result = result
    }
    func weather(for location: Location) async throws -> WeatherData {
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
