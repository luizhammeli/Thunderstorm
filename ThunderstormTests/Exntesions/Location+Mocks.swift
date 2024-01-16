//
//  Location+Mocks.swift
//  ThunderstormTests
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

import Foundation

@testable import Thunderstorm

extension Location {
    static var mock: Location {
        previews[0]
    }

    static var mocks: [Location] {
        [
            .init(id: "1", name: "Paris", country: "France", latitude: 48.857438, longitude: 2.295790),
            .init(id: "2", name: "New York", country: "United States", latitude: 40.690337, longitude: -74.045473),
            .init(id: "3", name: "Cape Town", country: "South Africa", latitude: -33.957369, longitude: 18.403098)
        ]
    }

    static var dataMock: Data {
        (try? JSONEncoder().encode(Location.previews)) ?? Data()
    }
}
