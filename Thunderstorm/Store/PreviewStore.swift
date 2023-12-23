//
//  PreviewStore.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 23/12/23.
//

import Combine

final class PreviewStore: Store {
    @Published var locations: [Location] = Location.previews

    var locationsPublisher: AnyPublisher<[Location], Never> {
        $locations.eraseToAnyPublisher()

    }

    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
}
