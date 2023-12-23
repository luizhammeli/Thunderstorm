//
//  WeatherData+Preview.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 23/12/23.
//

import Foundation

extension WeatherData {
    static var preview: Self {
        let url = Bundle.main.url(forResource: "clearsky", withExtension: "json")!

        let data = try! Data(contentsOf: url)

        return try! WeatherDataDecoder().decode(WeatherData.self, from: data)
    }
}

final class WeatherDataDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .secondsSince1970
    }
}
