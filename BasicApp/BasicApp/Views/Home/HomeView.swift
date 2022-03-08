//
//  HomeView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
