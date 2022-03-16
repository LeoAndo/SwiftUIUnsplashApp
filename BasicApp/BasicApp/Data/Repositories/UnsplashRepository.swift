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
    func searchPhotos() async throws -> UnSplashPhoto
}

final class UnsplashRepositoryImpl: UnsplashRepository {
    private var client: APIClient
    
    init(client: APIClient = Resolver.resolve(name:  Resolver.Name.unsplash)) {
        self.client = client
    }
    
    func searchPhotos() async throws -> UnSplashPhoto {
        return try await client.fetch(UnsplashService.SearchPhotos())
    }
}
