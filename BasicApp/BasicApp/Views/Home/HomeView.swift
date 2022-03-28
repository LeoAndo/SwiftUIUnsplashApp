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
                                AsyncImage(url: URL(string: j.urls.regular)) { phase in
                                    if let image = phase.image {
                                        image.resizable() // Displays the loaded image.
                                    } else if phase.error != nil {
                                        Image(systemName: "xmark.octagon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .foregroundColor(Color.red.opacity(0.8))
                                            .frame(width: 80, height: 80 )
                                            .cornerRadius(16)
                                    } else {
                                        Progress() // Acts as a placeholder.
                                    }
                                }
                                .frame(width: 200, height: 200 ).cornerRadius(16)
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
