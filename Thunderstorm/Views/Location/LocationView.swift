//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var viewModel: LocationViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            if viewModel.isLoading {
                ProgressView()
            } else {
                CurrentConditionsView(viewModel: viewModel.currentConditionsViewModel)
                    .padding(.top)

                Divider().padding(.top, 15.0)

                ForecastView(viewModel: viewModel.forecastViewModel)
            }
            
        }.padding(.horizontal)
        .navigationTitle(viewModel.title)
    }
}

#Preview {
    let viewModel = LocationViewModel(
        location: Location.preview,
        weatherService: WeatherPreviewClient()
    )

    return NavigationView {
        LocationView(viewModel: viewModel)
    }
}
