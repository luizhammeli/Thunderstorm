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

            switch viewModel.state {
            case .loading:
                ProgressView()
            case .data(let forecastViewModel, let currentConditionsViewModel):
                CurrentConditionsView(viewModel: currentConditionsViewModel)
                    .padding(.top)

                Divider().padding(.top, 15.0)

                ForecastView(viewModel: forecastViewModel)
            case .error(let message):
                Text(message)
                    .font(.body)
                    .foregroundStyle(Color.customDarkGray)
            }
            
        }.padding(.horizontal)
        .navigationTitle(viewModel.title)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel(
            location: Location.preview,
            weatherService: WeatherPreviewClient()
        )

        let viewModelWithError = LocationViewModel(
            location: Location.preview,
            weatherService: WeatherPreviewClient(result: .failure(NSError(domain: "", code: 0)))
        )

        return Group {
            NavigationView {
                LocationView(viewModel: viewModel)
            }

            NavigationView {
                LocationView(viewModel: viewModelWithError)
            }
        }
    }
}
