//
//  HomeUiState.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//

import Foundation

enum HomeUiState {
     struct Data {
         let images: [UnSplashPhoto.Result]
     }
     case initial
     case loading
     case data(Data)
     case error(String)
}
