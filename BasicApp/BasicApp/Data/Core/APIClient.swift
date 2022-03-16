//
//  APIClient.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Foundation
import Resolver

protocol APIClient {
    func fetch<R>(_ request: R) async throws -> R.ResponseEntity where R: APIRequest
}
extension Resolver.Name {
    static let unsplash = Self("unsplash")
}

final class APIClientImpl: APIClient {

    init() {
    }
    func fetch<R>(_ request: R) async throws -> R.ResponseEntity where R : APIRequest {
        let (data, response) = try await URLSession.shared.data(for: request.asURLRequest())
        if let response = response as? HTTPURLResponse {
            if response.statusCode != HTTPStatusCode.ok.rawValue {
                let error: APIError
                if let code = response.status {
                    error = .http(code)
                    throw error
                } else {
                    error = .unexpected
                }
            }
        }
        let typeObjects = try JSONDecoder().decode(R.ResponseEntity.self, from: data)
        return typeObjects
    }
}
