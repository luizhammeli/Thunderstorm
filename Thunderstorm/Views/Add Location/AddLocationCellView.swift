//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct AddLocationCellView: View {
    let viewModel: AddLocationCellViewModel
    let didTapPlusButton: () -> Void

    var body: some View {
        HStack {
            Button(action: didTapPlusButton, label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18.0)
                    .padding(.horizontal, 8.0)
                    .tint(.green)

            })
            .background(.white)
            .buttonStyle(.borderless)

            Spacer()
                .frame(width: 20.0)

            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                    .foregroundStyle(.accent)
                Text(viewModel.country)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(viewModel.coordinates)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer()
        }

    }
}

#Preview {
    let viewModel = AddLocationCellViewModel(location: Location.preview)
    return AddLocationCellView(
        viewModel: viewModel,
        didTapPlusButton: {}
    )
}
