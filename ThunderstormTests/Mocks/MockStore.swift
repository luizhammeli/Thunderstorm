//
//  MockStore.swift
//  ThunderstormTests
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

import Combine
import Foundation
import SwiftUI

@testable import Thunderstorm

final class MockStore: Store {
    var locationsPublisher: AnyPublisher<[Thunderstorm.Location], Never> {
        $locations.eraseToAnyPublisher()
    }

    @Published private(set) var locations: [Location]

    init(locations: [Location]) {
        self.locations = locations
    }

    func addLocation(_ location: Thunderstorm.Location) throws {
        locations.append(location)
    }
    
    func removeLocation(_ location: Thunderstorm.Location) throws {
        locations.removeAll { $0.id == location.id }
    }
}
