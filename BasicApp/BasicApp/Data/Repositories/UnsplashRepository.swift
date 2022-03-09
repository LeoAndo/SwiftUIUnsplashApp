//
//  UnsplashRepository.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//

import Combine
import Foundation
import Alamofire

protocol UnsplashRepository: AnyObject {
    func searchPhotos(completion: @escaping ([UnSplashPhoto.Result])->Void)
}

final class UnsplashRepositoryImpl: UnsplashRepository {
    func searchPhotos(completion: @escaping ([UnSplashPhoto.Result]) -> Void) {
        let API_KEY = "TODO"
        let url = "https://api.unsplash.com/search/photos?query=dogs&page=1&per_page=10"
        // let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(API_KEY)"
        
        let headers: HTTPHeaders = [
            "Accept-Version": "v1",
            "Authorization": "Client-ID \(API_KEY)"
        ]

        AF.request(url, method: .get, headers: headers).responseDecodable(of: UnSplashPhoto.self) { response in
            completion(response.value!.results)
        }
    }
}
