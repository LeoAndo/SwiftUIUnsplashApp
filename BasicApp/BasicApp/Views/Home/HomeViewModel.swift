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

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var uiState:HomeUiState = HomeUiState.initial
    private let repository: UnsplashRepository
    private var cancellables = Set<AnyCancellable>()
    
    
    private(set)lazy var onAppear:() -> Void = { [weak self] in
        guard let self = self else { return }
        print("Perform the processing when the screen is displayed here.")
    }
    
    /**
     2022-03-16 20:21:08.921845+0900 BasicApp[92240:3254766] [SwiftUI] Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
     */
    init(repository: UnsplashRepository = Resolver.resolve()) {
        self.repository = repository
        uiState = HomeUiState.loading
        Task {
            do {
                let photos = try await repository.searchPhotos()
                self.uiState = HomeUiState.data(HomeUiState.Data(images: photos.results))
            } catch {
                guard let e =  error as? APIError else { return }
                self.uiState = HomeUiState.error(e.message)
            }
        }
    }
}
