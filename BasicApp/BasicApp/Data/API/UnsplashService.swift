//
//  UnsplashService.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Foundation

protocol UnsplashServiceRequest: APIRequest {}

extension UnsplashServiceRequest {
    var baseURL: String { APIBaseURL.unsplash.value }
    var apiKey: String  { "TODO INPUT HERE" }
}

enum UnsplashService {
    struct SearchPhotos: UnsplashServiceRequest {
        init() {}
        typealias ResponseEntity = UnSplashPhoto
        var method: HTTPMethod { .get }
        var path: String = "search/photos"
        func asURLRequest() throws -> URLRequest {
            var urlComponents = URLComponents(string: baseURL + path)!
            urlComponents.queryItems = [
                URLQueryItem(name: "query", value: "dogs"),
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "per_page", value: "10")
            ]
            var request = URLRequest(url: urlComponents.url!)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.allHTTPHeaderFields = ["Accept-Version": "v1"]
            request.allHTTPHeaderFields = ["Authorization": "Client-ID \(apiKey)"]
            return request
        }
        
    }
}
