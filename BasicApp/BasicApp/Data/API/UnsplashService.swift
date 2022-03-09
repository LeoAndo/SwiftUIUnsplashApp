//
//  UnsplashService.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Alamofire
import Combine
import Foundation

protocol UnsplashServiceRequest: APIRequest {}

extension UnsplashServiceRequest {
    var baseURL: URL { APIBaseURL.unsplash.value }
}

enum UnsplashService {
    struct SearchPhotos: UnsplashServiceRequest {
        typealias ResponseEntity = UnSplashPhoto
        var method: HTTPMethod { .get }
        var queryParameters: Parameters? {
            [
                "query": "dogs",
                "page": 1,
                "per_page": "10",
            ]
        }
        var path: String = "search/photos"
        init() {
        }
    }
}
