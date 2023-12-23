//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 02/12/23.
//

import SwiftUI

struct LocationsView: View {
    // MARK: - Properties

    @ObservedObject private(set) var viewModel: LocationsViewModel
    @State var showsAddsLocation: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20, content: {
                    Button {
                        showsAddsLocation.toggle()
                    } label: {
                        Text(viewModel.addButtonTitle)
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.accentColor)
                            .clipShape(.capsule)
                    }

                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        NavigationLink {
                            LocationView(viewModel: viewModel.locationViewModel)
                        } label: {
                            LocationCellView(viewModel: viewModel)
                        }
                    }
                })
                .padding()
            }
            .onAppear {
                viewModel.start()
            }
            .navigationTitle(viewModel.title)
            .sheet(isPresented: $showsAddsLocation, content: {
                AddLocationView(
                    viewModel: viewModel.addLocationViewModel,
                    showLocationView: $showsAddsLocation
                )
            })
        }
    }
}

#Preview {
    LocationsView(viewModel: .init(store: PreviewStore()))
}
