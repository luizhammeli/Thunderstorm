//
//  GeocodingPreviewClient.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 10/12/23.
//

import Foundation

struct GeocodingPreviewClient: GeocodingService {
    func geocodeAddressString(_ AddressString: String) -> [Location] {
        Location.previews
    }
}
