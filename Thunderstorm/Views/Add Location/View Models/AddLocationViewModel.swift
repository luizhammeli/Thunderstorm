//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Combine
import SwiftUI

@MainActor
final class AddLocationViewModel: ObservableObject {
    enum State: Equatable {
        case empty
        case querying
        case message(String)
        case results([AddLocationCellViewModel])
    }

    // MARK: - Published Properties

    @Published var title: String = "Enter the name of a city ..."
    @Published var query: String = ""
    @Published var state: State = .empty
    @Published private var isQuerying = false
    @Published private var locations: [Location] = []

    // MARK: - Properties

    private let geocodingService: GeocodingService
    private let localStorage: Store
    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Computed Properties

    var placeHolder: String {
        "Enter the name of a city ..."
    }

    // MARK: - Initializer

    init(
        geocodingService: GeocodingService,
        localStorage: Store
    ) {
        self.geocodingService = geocodingService
        self.localStorage = localStorage
        setupBindings()
    }

    // MARK: -

    func addLocation(id: String) {
        guard let location = locations.first(where: { $0.id == id }) else {
            return
        }

        try? localStorage.addLocation(location)
    }
    
    private func setupBindings() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .sink { [weak self] addressString in
                self?.geocodeAddressString(addressString)
        }.store(in: &subscriptions)

        $locations
            .map { $0.map(AddLocationCellViewModel.init) }
            .combineLatest($query, $isQuerying)
            .map { viewModels, query, isQuerying -> State in
                if isQuerying { return .querying }

                if query.isEmpty { return .empty }

                if viewModels.isEmpty { return .message("No matches found...") }

                return .results(viewModels)
            }
            .eraseToAnyPublisher()
            .removeDuplicates()
            .assign(to: &$state)
    }

    private func geocodeAddressString(_ adressString: String) {
        guard adressString.count > 2 else {
            return locations.removeAll()            
        }

        Task {
            isQuerying = true
            do {
                locations = try await geocodingService.geocodeAddressString(adressString)
            } catch {
                locations.removeAll()
            }
            isQuerying = false
        }
    }
}
