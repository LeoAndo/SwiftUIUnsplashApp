//
//  TodoView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var viewModel: TodoViewModel
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

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(viewModel: TodoViewModel())
    }
}
