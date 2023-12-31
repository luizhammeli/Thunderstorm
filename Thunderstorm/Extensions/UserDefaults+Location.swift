//
//  UserDefaults+Location.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 17/12/23.
//

import Combine
import Foundation

extension UserDefaults: Store {
    var locationsPublisher: AnyPublisher<[Location], Never> {
        self.publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    enum Keys {
        static var locations: String = "locations"
    }

    @objc var locations: Data? {
        get {
            data(forKey: Keys.locations)
        }
    }

    func addLocation(_ location: Location) throws {
        var locations = try? decode([Location].self,  for: Keys.locations) ?? []
        locations?.append(location)

        try encode(locations, for: Keys.locations)
    }

    func removeLocation(with id: String) throws {
        let locations = try decode([Location].self, for: Keys.locations)
        let filteredLocation = locations?.filter { $0.id != id }

        try encode(filteredLocation, for: Keys.locations)
    }
}

fileprivate extension UserDefaults {
    func decode<T: Decodable>(_ type: T.Type, for key: String) throws -> T? {
        guard let data = data(forKey: key) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }

    func encode<T: Encodable>(_ value: T, for key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data, forKey: key)
    }
}
