//
//  Location.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import Foundation
import CoreLocation

struct Location: Codable, Equatable {
    // MARK: - Properties
    
    let id: String
    let name: String
    let country: String
    
    // MARK: -
    let latitude: Double
    let longitude: Double
}

extension Location {
    init?(placemark: CLPlacemark) {
        guard let name = placemark.name,
              let country = placemark.country,
              let latitude = placemark.location?.coordinate.latitude,
              let longitude = placemark.location?.coordinate.longitude
        else { return nil }

        self.id = UUID().uuidString
        self.name = name
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Location {
    static var preview: Location {
        previews[0]
    }

    static var previews: [Location] {
        [
            .init(id: "1", name: "Paris", country: "France", latitude: 48.857438, longitude: 2.295790),
            .init(id: "2", name: "New York", country: "United States", latitude: 40.690337, longitude: -74.045473),
            .init(id: "3", name: "Cape Town", country: "South Africa", latitude: -33.957369, longitude: 18.403098)
        ]
    }
    
    static var dataPreview: Data {
        (try? JSONEncoder().encode(Location.previews)) ?? Data()
    }
}
