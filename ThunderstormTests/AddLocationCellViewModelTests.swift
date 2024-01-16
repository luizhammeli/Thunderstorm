//
//  AddLocationCellViewModelTests.swift
//  ThunderstormTests
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

import XCTest

@testable import Thunderstorm

final class AddLocationCellViewModelTests: XCTestCase {
    func testTestIdentifiableConformance() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)

        XCTAssertEqual(viewModel.id, location.id)
    }

    func testComputedProperties() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)

        XCTAssertEqual(viewModel.name, location.name)
        XCTAssertEqual(viewModel.country, location.country)
        XCTAssertEqual(viewModel.coordinates, "\(location.latitude), \(location.longitude)")
    }
}
