//
//  ForecastView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct ForecastView: View {
    let viewModel: ForecastViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 20, content: {
                ForEach(viewModel.cellViewModels) {
                    ForecastCellView(viewModel: $0)
                }
            }).padding(.top, 15)
        }
    }
}

#Preview {
    ForecastView(
        viewModel: .init(conditions: WeatherData.preview.forecast)
    )
}
