//
//  UserDefaults+Location.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 17/12/23.
//

import Foundation

extension UserDefaults {
    enum Keys {
        static var locations: String = "locations"
    }

    @objc var locations: Data? {
        get {
            data(forKey: Keys.locations)
        }

        set {
            setValue(newValue, forKey: Keys.locations)
        }
    }
}
