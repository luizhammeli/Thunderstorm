//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 28/12/23.
//

import Foundation

enum Configuration {
    enum Keys {
        static let clearSkyBaseURL = "CLEAR_SKY_BASE_URL"
        static let clearSkyAPIKey = "CLEAR_SKY_API_KEY"
    }

    static var clearSkyBaseURL: URL {
        let stringURL = infoDictionary[Keys.clearSkyBaseURL] as? String ?? ""
        return URL(string: stringURL)!
    }

    static var clearSkyAPIKey: String {
        infoDictionary[Keys.clearSkyAPIKey] as? String ?? ""
    }

    private static var infoDictionary: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }
 }
