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

    var title: String {
        "Thunderstorm"
    }

    var addButtonTitle: String {
        "Add Location"
    }

    var addLocationViewModel: AddLocationViewModel{
        AddLocationViewModel(geocodingService: GeocodingClient())
    }

    func start() {
        UserDefaults.standard
            .publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .map({ $0.map(LocationCellViewModel.init(location:)) })
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
