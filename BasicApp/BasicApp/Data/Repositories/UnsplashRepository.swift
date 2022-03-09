//
//  UnsplashRepository.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/08.
//

import Combine
import Foundation
import Resolver

protocol UnsplashRepository: AnyObject {
    func searchPhotos()  -> AnyPublisher<UnSplashPhoto, APIError>
}

final class UnsplashRepositoryImpl: UnsplashRepository {
    private var client: APIClient
    
    init(client: APIClient = Resolver.resolve(name:  Resolver.Name.unsplash)) {
        self.client = client
    }
    
    func searchPhotos() -> AnyPublisher<UnSplashPhoto, APIError> {
        self.client.requestPublisher(UnsplashService.SearchPhotos())
    }
}
