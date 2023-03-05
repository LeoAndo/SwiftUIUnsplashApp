//
//  APIError.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation

enum APIError: Error {
    case http(HTTPStatusCode)
    case unexpected
}

extension APIError {
    var message: String {
        switch self {
        case let .http(code):
            if code == .unauthorized {
                return "Authentication error! HTTP status code is (\(code.rawValue))"
            }
            return "unhandled HTTP status code error (\(code.rawValue))"
        case .unexpected:
            return "unexpected"
        }
    }
}
