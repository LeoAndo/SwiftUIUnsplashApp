//
//  HomeView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        HomeContent(uiState: viewModel.uiState)
    }
}

struct HomeContent: View {
    let uiState: HomeUiState
    var body: some View {
        switch self.uiState {
        case .data(let data):
            VStack(spacing: 0) {
                if !data.images.isEmpty {
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 16) {
                            ForEach(data.images) { j in
                                AnimatedImage(url: URL(string: j.urls.regular))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 200 )
                                    .cornerRadius(16)
                            }
                        }.padding(.top)
                    }
                } else {
                    Text("result empty...")
                }
            }
            .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top)
        case .initial:
            EmptyView()
        case .loading:
            Progress()
        case .error(let message):
            Text(message)
        }
    }
}

struct HomeContent_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HomeContent(uiState: HomeUiState.error("Error!!!!"))
            HomeContent(uiState: HomeUiState.loading)
            HomeContent(uiState: HomeUiState.initial)
        }
    }
}
