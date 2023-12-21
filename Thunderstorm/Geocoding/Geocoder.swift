//
//  Geocoder.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 15/12/23.
//

import CoreLocation

protocol Geocoder {
    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}
