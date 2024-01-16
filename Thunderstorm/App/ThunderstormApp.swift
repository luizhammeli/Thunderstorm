//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import SwiftUI

@main
struct ThunderstormApp: App {
    init() {
        registerServices()
    }

    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init(
                store: DependencyContainer.store,
                weatherService: WeatherClient())
            )
        }
    }

    private func registerServices() {
        DependencyContainer.shared.register(Store.self) { _ in
            UserDefaults.standard
        }
    }
}
