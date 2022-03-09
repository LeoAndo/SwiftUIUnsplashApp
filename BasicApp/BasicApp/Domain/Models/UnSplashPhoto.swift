//
//  UnSplashPhoto.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation

struct UnSplashPhoto : Decodable {
    var total: Int
    var total_pages: Int
    var results: [Result]
    struct Result : Decodable, Identifiable {
        var id: String
        var urls: Urls
        var user: User
    }
    struct Urls : Decodable {
        var full: String
        var regular: String
    }
    struct User : Decodable {
        var username: String
        var profile_image: ProfileImage
    }
    struct ProfileImage : Decodable {
        var small: String?
    }
}


