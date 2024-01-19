//
//  AddLocationViewModelTests.swift
//  ThunderstormTests
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

//import Combine
import Foundation
import XCTest

@testable import Thunderstorm

final class AddLocationViewModelTests: XCTestCase {
    //private var subscriptions: Set<AnyCancellable> = []

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        //subscriptions.removeAll()
    }

    func testTextFieldPlaceholder() async {
        let viewModel = await AddLocationViewModel(
            geocodingService: MockGeocodingClient(result: .success([])),
            localStorage: MockStore(locations: [])
        )

        let placeHolder = await viewModel.placeHolder

        XCTAssertEqual(placeHolder, "Enter the name of a city ...")
    }

    @MainActor
    func testAddLocation() async {
        await simulateSearch(result: .success([Location.mock]), query: "value") { viewModel, store in
            viewModel.addLocation(id: "1")
            XCTAssertEqual(store.locations, [Location.mock])
        }
    }

    @MainActor
    func testSearchWithResults() async {
        await simulateSearch(result: .success([Location.mock]), query: "value") { viewModel, _ in
            XCTAssertEqual(viewModel.state, .results([AddLocationCellViewModel(location: Location.mock)]))
        }
    }

    @MainActor
    func testSearchWithNoResults_() async {
        await simulateSearch(result: .success([]), query: "value") { viewModel, _ in
            XCTAssertEqual(viewModel.state, .message("No matches found..."))
        }
    }

    @MainActor
    func testSearchError() async {
        await simulateSearch(result: .failure(.failedRequest), query: "value", locations: [.mock]) { viewModel, _ in
            XCTAssertEqual(viewModel.state, .message("No matches found..."))
        }
    }

    @MainActor
    func testEmptySearch() async {
        await simulateSearch(result: .failure(.failedRequest), locations: [.mock]) { viewModel, _ in
            XCTAssertEqual(viewModel.state, .empty)
        }
    }

    //    @MainActor
    //    func test_() async {
    //        let store = MockStore(locations: [])
    //        let geocodingService = MockGeocodingClient(result: .success([Location.mock]))
    //
    //        let viewModel = AddLocationViewModel(
    //            geocodingService: geocodingService,
    //            localStorage: store
    //        )
    //
    //        let exp = expectation(description: #function)
    //
    ////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
    ////            exp.fulfill()
    ////        }
    //
    //        // await fulfillment(of: [exp], timeout: 5.0)
    //
    //
    //        store.locationsPublisher
    //            .filter { locations in
    //                !locations.isEmpty
    //            }
    //            .sink { locations in
    //                DispatchQueue.main.async {
    //                    viewModel.addLocation(id: "1")
    //                }
    ////                XCTAssertEqual(locations, [Location.mock])
    //                exp.fulfill()
    //            }
    //            .store(in: &subscriptions)
    //
    //        viewModel.setQuery(with: "value")
    //
    //        await fulfillment(of: [exp], timeout: 10.0)
    //    }
}

private extension AddLocationViewModelTests {
    @MainActor
    func makeSUT(
        result: Result<[Location], MockGeocodingClient.GeoError>,
        locations: [Location] = []
    ) -> (AddLocationViewModel, MockStore) {
        let store = MockStore(locations: locations)
        let geocodingService = MockGeocodingClient(result: result)

        let viewModel = AddLocationViewModel(
            geocodingService: geocodingService,
            localStorage: store,
            throttleInterval: 0
        )

        return (viewModel, store)
    }

    @MainActor
    func simulateSearch(
        result: Result<[Location], MockGeocodingClient.GeoError>,
        query: String = "",
        locations: [Location] = [],
        action: (AddLocationViewModel, MockStore) -> Void
    ) async {
        let (viewModel, store) = makeSUT(result: result, locations: locations)

        let exp = expectation(description: #function)

        viewModel.setQuery(with: query)

        DispatchQueue.main.async { exp.fulfill() }

        await fulfillment(of: [exp], timeout: 1.0)

        action(viewModel, store)
    }
}

extension AddLocationViewModel {
    func setQuery(with value: String) {
        query = value
    }
}
