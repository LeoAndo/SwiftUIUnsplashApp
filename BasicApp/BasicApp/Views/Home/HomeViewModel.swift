//
//  HomeViewModel.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//
import Foundation
import Resolver

final class HomeViewModel: ObservableObject {
    @Published var uiState:HomeUiState = HomeUiState.initial
    private let repository: UnsplashRepository
    
    private(set)lazy var onAppear:() -> Void = { [weak self] in
        guard let self = self else { return }
        print("画面が表示された時の処理をここで行う")
    }
    
    init(repository: UnsplashRepository = Resolver.resolve()) {
        self.repository = repository
        uiState = HomeUiState.loading
        repository.searchPhotos() { photos in
            print(photos.self.count)
            self.uiState = HomeUiState.data(HomeUiState.Data(images: photos))
        }
    }
}
