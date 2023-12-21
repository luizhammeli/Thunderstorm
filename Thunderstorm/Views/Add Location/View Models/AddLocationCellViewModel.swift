//
//  AddLocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct AddLocationCellViewModel: Identifiable, Equatable {
    // MARK: - Properties

    private let location: Location

    // MARK: - ID
    
    var id: String {
        location.id
    }

    // MARK: - Initialization

    init(location: Location) {
        self.location = location
    }

    // MARK: - Public API

    var name: String {
        location.name
    }

    var country: String {
        location.country
    }

    var coordinates: String {
        "\(location.latitude), \(location.longitude)"
    }
}
