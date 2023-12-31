//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct ForecastCellView: View {
    let viewModel: ForecastCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.day)
                    .font(.title)
                    .foregroundStyle(.accent)

                Group {
                    Text(viewModel.date)
                    Text(viewModel.summary).padding(.top, 5.0)
                }.font(.body)
                .foregroundStyle(.darkGray)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.darkGray)

                Group {
                    Text(viewModel.windSpeed)
                    Text(viewModel.temperature)
                }.font(.body)
                .foregroundColor(.darkGray)
            }
        }
    }
}

#Preview {
    ForecastCellView(
        viewModel: .init(dayCondition: WeatherData.preview.forecast[0])
    )
}
