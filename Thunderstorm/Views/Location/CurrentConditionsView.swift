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
        HStack {
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
            }.padding()

            Spacer()

            Button(action: {
                viewModel.delete()
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(.accentColor)
            })
        }
    }
}

#Preview {
    let currently = WeatherData.preview.currently
    return CurrentConditionsView(
        viewModel: .init(
            currentConditions: currently,
            location: Location.preview, 
            store: PreviewStore()
        )
    )
}
