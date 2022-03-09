//
//  APIRequest.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Alamofire
import Foundation

protocol APIRequest: URLRequestConvertible {
    associatedtype ResponseEntity: Decodable
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var queryParameters: Parameters? { get }
}

extension APIRequest {
    var headers: HTTPHeaders { ["Content-Type": "application/json"] }
    var queryParameters: Parameters? { nil }
}

extension APIRequest {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var req = URLRequest(url: url)
        req.method = method
        req.headers = headers

        if let query = queryParameters {
            req = try URLEncoding.default.encode(req, with: query)
        }
        return req
    }
}

enum APIBaseURL {
    case unsplash
    var value: URL {
        switch self {
        case .unsplash:
            return URL(string: "https://api.unsplash.com/")!
        }
    }
}
