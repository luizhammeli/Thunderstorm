//
//  MockGeocodingClient.swift
//  ThunderstormTests
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

import Foundation
@testable import Thunderstorm

final class MockGeocodingClient: GeocodingService {
    enum GeoError: Error {
        case failedRequest
    }

    private var result: Result<[Location], GeoError>

    init(result: Result<[Location], GeoError>) {
        self.result = result
    }

    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        switch result {
        case .success(let locations):
            return locations
        case .failure(let error):
            throw error
        }
    }
}
