//
//  GeocodingService.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 10/12/23.
//

import Foundation

protocol GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location]
}
