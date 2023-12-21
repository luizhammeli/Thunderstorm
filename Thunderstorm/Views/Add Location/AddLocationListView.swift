//
//  AddLocationListView.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 16/12/23.
//

import SwiftUI

struct AddLocationListView: View {
    private let viewModels: [AddLocationCellViewModel]
    private var action: (String) -> Void

    init(_ viewModels: [AddLocationCellViewModel], action: @escaping (String) -> Void) {
        self.viewModels = viewModels
        self.action = action
    }

    var body: some View {
        List(viewModels) { viewModel in
            AddLocationCellView(viewModel: viewModel) {
                action(viewModel.id)
            }
        }
    }
}
