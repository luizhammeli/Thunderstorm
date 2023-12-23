//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    private var store: Store

    var title: String {
        "Thunderstorm"
    }

    var addButtonTitle: String {
        "Add Location"
    }

    var addLocationViewModel: AddLocationViewModel{
        AddLocationViewModel(geocodingService: GeocodingClient(), localStorage: store)
    }

    init(store: Store) {
        self.store = store
    }

    func start() {
        store.locationsPublisher
            .map({ $0.map(LocationCellViewModel.init(location:)) })
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
