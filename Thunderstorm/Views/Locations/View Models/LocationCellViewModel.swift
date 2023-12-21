//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import Foundation

struct LocationCellViewModel: Identifiable {
    // MARK: - Properties
    
    let location: Location
    
    init(location: Location) {
        self.location = location
    }

    // MARK: - Identifiable
    
    var id: String {
        location.id
    }
    
    // MARK: -

    var locationViewModel: LocationViewModel {
        LocationViewModel(location: location)
    }

    var locationName: String {
        self.location.name
    }

    var locationCountry: String {
        self.location.country
    }

    var summary: String? {
        "Clear"
    }

    var windSpeed: String? {
        "10 mi/h"
    }

    var temperature: String? {
        "90 °F"
    }
}
