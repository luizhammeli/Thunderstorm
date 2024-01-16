//
//  Colors.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import UIKit
import SwiftUI

extension UIColor {
    static let customDarkGray = UIColor(named: "CDarkGray")
}

extension Color {
    static let customDarkGray = Color(.customDarkGray ?? .darkGray)
}
