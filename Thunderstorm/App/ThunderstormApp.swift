//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import SwiftUI

@main
struct ThunderstormApp: App {
    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init(store: UserDefaults.standard))
        }
    }
}
