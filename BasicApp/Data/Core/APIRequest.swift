//
//  APIRequest.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Foundation

protocol APIRequest {
    associatedtype ResponseEntity: Decodable
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    func asURLRequest() throws -> URLRequest
}

enum APIBaseURL {
    case unsplash
    var value: String {
        switch self {
        case .unsplash:
            return "https://api.unsplash.com/"
        }
    }
}
