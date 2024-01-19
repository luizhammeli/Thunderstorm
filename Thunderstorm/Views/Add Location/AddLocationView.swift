//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import SwiftUI

struct AddLocationView: View {
    @ObservedObject var viewModel: AddLocationViewModel
    @Binding var showLocationView: Bool

    var body: some View {
        VStack {
            TextField(viewModel.placeHolder, text: $viewModel.query).padding()
            switch viewModel.state {
            case .empty:
                Spacer()
            case .querying:
                MessageView(style: .progressView)
            case .message(let message):
                MessageView(style: .message(message))
            case .results(let cellViewModels):
                AddLocationListView(cellViewModels) {
                    viewModel.addLocation(id: $0)
                    showLocationView.toggle()
                }
            }
        }
    }
}

#Preview {
    let viewModel = AddLocationViewModel(geocodingService: GeocodingPreviewClient(), 
                                         localStorage: PreviewStore())
    return AddLocationView(
        viewModel: viewModel,
        showLocationView: .constant(true)
    )
}
