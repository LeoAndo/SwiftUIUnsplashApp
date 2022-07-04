//
//  HomeView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        HomeViewStateless(uiState: viewModel.uiState)
    }
}

struct HomeViewStateless: View {
    let uiState: HomeUiState
    var body: some View {
        switch self.uiState {
        case .data(let data):
            VStack(spacing: 20) {
                if !data.images.isEmpty {
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVStack(spacing: 16) {
                            ForEach(data.images) { j in
                                AsyncImage(url: URL(string: j.urls.regular)) { phase in
                                    if let image = phase.image {
                                       image.resizable() // Displays the loaded image.
                                    } else if phase.error != nil {
                                        Image(systemName: "xmark.octagon")
                                            .resizable()
                                            .frame(width: 80, height: 80 )
                                            .cornerRadius(16)
                                    } else {
                                        ProgressView() // Acts as a placeholder.
                                    }
                                }
                                .frame(width: 200, height: 200 ).cornerRadius(16)
                            }
                        }
                    }
                } else {
                    Text("result empty...")
                }
            }
        case .initial:
            EmptyView()
        case .loading:
            ProgressView()
        case .error(let message):
            Text(message)
        }
    }
}

struct HomeContent_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HomeViewStateless(uiState: HomeUiState.error("Error!!!!"))
            HomeViewStateless(uiState: HomeUiState.loading)
            HomeViewStateless(uiState: HomeUiState.initial)
        }
    }
}
