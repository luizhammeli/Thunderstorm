//
//  NavigationLazyView.swift
//  TravelDiscovery
//
//  Created by Luiz on 04/11/20.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
