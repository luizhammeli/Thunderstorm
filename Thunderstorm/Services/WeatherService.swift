//
//  WeatherService.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 24/12/23.
//

import Foundation

protocol WeatherService {
    func weather(for location: Location) async throws -> WeatherData
}
