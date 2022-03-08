//
//  HomeViewModel.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var uiState:HomeUiState = HomeUiState.initial
    
    private(set)lazy var onAppear:() -> Void = { [weak self] in
        guard let self = self else { return }
        // 画面が表示された時の処理をここで行う
        self.uiState = HomeUiState.data(HomeUiState.Data(title: "Home", description: "description"))
    }
}
