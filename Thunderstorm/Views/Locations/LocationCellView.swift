//
//  LocationCellView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import SwiftUI

struct LocationCellView: View {
    // MARK: - Properties

    @ObservedObject var viewModel: LocationCellViewModel

    var body: some View {

        VStack(alignment: .leading)  {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(viewModel.locationName)")
                        .font(.title)
                        .foregroundStyle(Color.accentColor)

                    Text("\(viewModel.locationCountry)")
                        .font(.body)
                        .foregroundStyle(Color.gray)
                }

                Spacer()

                VStack {
                    HStack {
                        Image(systemName: "thermometer").foregroundColor(.gray)
                        Text(viewModel.temperature ?? "")
                    }

                    HStack {
                        Image(systemName: "wind").foregroundColor(.gray)
                        Text(viewModel.windSpeed ?? "")
                    }
                }

            }
            Text(viewModel.summary ?? "").padding(.top, 5)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.gray)
        }
    }
}

#Preview {
    LocationCellView(
        viewModel: .init(
            location: Location.preview,
            weatherService: WeatherPreviewClient()
        )
    )
}
