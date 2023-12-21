//
//  CurrentConditionsView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct CurrentConditionsView: View {
    let viewModel: CurrentConditionsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.temperature)
                .font(.largeTitle)

            Group {
                HStack {
                    Image(systemName: "wind")
                        .foregroundStyle(Color.gray)
                    Text(viewModel.windSpeed)
                }
            }.font(.body)

            Text(viewModel.summary).padding(.top, 15.0)
        }
    }
}

#Preview {
    CurrentConditionsView(viewModel: .init())
}
