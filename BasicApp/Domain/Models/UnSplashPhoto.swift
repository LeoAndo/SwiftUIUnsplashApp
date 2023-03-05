//
//  UnSplashPhoto.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation

struct UnSplashPhoto : Decodable {
    let total: Int
    let total_pages: Int
    let results: [Result]
    struct Result : Decodable, Identifiable {
        let id: String
        let urls: Urls
    }
    struct Urls : Decodable {
        let full: String
        let regular: String
    }
}
