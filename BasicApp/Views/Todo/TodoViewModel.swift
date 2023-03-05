//
//  TodoViewModel.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//

import Foundation

final class TodoViewModel: ObservableObject {
    @Published var uiState = TodoUiState.initial
    
    private(set)lazy var onAppear:() -> Void = { [weak self] in
        guard let self = self else { return }
        // 画面が表示された時の処理をここで行う
        self.uiState = TodoUiState.data(TodoUiState.Data(title: "Please wait. It is being implemented.", description: "description"))
    }
}
