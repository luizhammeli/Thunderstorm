//
//  GeocodingClient.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 10/12/23.
//

import Foundation
import CoreLocation

final class GeocodingClient: GeocodingService {
    enum GeocodingError: Error {
        case invalidAddressString
        case requestFailed
    }

    private let geocoder: Geocoder

    init(geocoder: Geocoder = CLGeocoder()) {
        self.geocoder = geocoder
    }

    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }

        do {
            return try await geocoder.geocodeAddressString(addressString).compactMap { Location(placemark: $0) }
        } catch {
            throw GeocodingError.requestFailed
        }
    }
}
