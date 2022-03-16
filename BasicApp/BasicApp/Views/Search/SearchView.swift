//
//  SeachView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        switch viewModel.uiState {
        case .data(let data):
            Text(data.title)
        case .initial:
            Text("initial").onAppear(perform: viewModel.onAppear)
        case .loading:
            Text("loading")
        case .error(let message):
            Text(message)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
