//
//  Store.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 23/12/23.
//

import Combine

protocol Store: AnyObject {
    var locationsPublisher: AnyPublisher<[Location], Never> { get }
    func addLocation(_ location: Location) throws
    func removeLocation(_ location: Location) throws
}
