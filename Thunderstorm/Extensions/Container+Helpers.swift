//
//  Container+Helpers.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 16/01/24.
//

import Swinject

//extension Container {
//    static let shared = Container()
//    static var store: Store {
//        shared.resolve(Store.self)!
//    }
//}

final class DependencyContainer {
    static let shared = Container()
    static var store: Store {
        shared.resolve(Store.self)!
    }
}
