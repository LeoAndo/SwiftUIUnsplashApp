//
//  HomeViewModel.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//
import Foundation
import Combine
import Foundation
import Resolver

final class HomeViewModel: ObservableObject {
    @Published var uiState:HomeUiState = HomeUiState.initial
    private let repository: UnsplashRepository
    private var cancellables = Set<AnyCancellable>()
    
    
    private(set)lazy var onAppear:() -> Void = { [weak self] in
        guard let self = self else { return }
        print("Perform the processing when the screen is displayed here.")
    }
    
    init(repository: UnsplashRepository = Resolver.resolve()) {
        self.repository = repository
        uiState = HomeUiState.loading
        repository.searchPhotos().sink { completion in
            switch completion {
            case .finished:
                print("fetch Finished!")
            case let .failure(error):
                print("fetch failure!")
                self.uiState = HomeUiState.error(error.message)
            }
        } receiveValue: { photos in
            self.uiState = HomeUiState.data(HomeUiState.Data(images: photos.results))
        }.store(in: &cancellables)
    }
}
