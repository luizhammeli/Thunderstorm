//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct LocationView: View {
    let viewModel: LocationViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CurrentConditionsView(viewModel: viewModel.currentConditionsViewModel)
                .padding(.top)

            Divider().padding(.top, 15.0)

            ForecastView(viewModel: viewModel.forecastViewModel)
            
        }.padding(.horizontal)
        .navigationTitle(viewModel.location.name)
    }
}

#Preview {
    let viewModel = LocationViewModel(
        location: Location.preview,
        weatherData: WeatherData.preview
    )

    return NavigationView {
        LocationView(viewModel: viewModel)
    }
}
