//
//  WeatherDataDecoder.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 24/12/23.
//

import Foundation

final class WeatherDataDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .secondsSince1970
    }
}
