//
//  MessageView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 16/12/23.
//

import SwiftUI

struct MessageView: View {
    enum Style {
        case message(String)
        case progressView
    }

    let style: Style

    var body: some View {
        VStack {
            Spacer()
            switch style {
            case .message(let message):
                Text(message)
                    .font(.body)
                    .foregroundStyle(.darkGray)
            case .progressView:
                ProgressView()
            }
            Spacer()
        }
    }
}
