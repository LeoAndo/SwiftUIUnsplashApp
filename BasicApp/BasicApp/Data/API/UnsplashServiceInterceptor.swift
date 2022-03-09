//
//  UnsplashServiceInterceptor.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Alamofire
import Foundation
import Resolver

final class UnsplashServiceInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        let API_KEY = "TODO INPUT HERE"
        request.headers.add(name: "Accept-Version", value: "v1")
        request.headers.add(name: "Authorization", value: "Client-ID \(API_KEY)")
        completion(.success(request))
    }
}
