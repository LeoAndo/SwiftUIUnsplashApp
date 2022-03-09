//
//  APIClient.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//
import Alamofire
import Combine
import Foundation
import Resolver

/// @mockable
protocol APIClient {
    func requestPublisher<R>(_ request: R) -> AnyPublisher<R.ResponseEntity, APIError> where R: APIRequest
}
extension Resolver.Name {
    static let unsplash = Self("unsplash")
}

final class APIClientImpl: APIClient {
    private let session: Alamofire.Session

    init(interceptor: RequestInterceptor?) {
        session = .init(interceptor: interceptor)
    }

    func requestPublisher<R>(_ request: R) -> AnyPublisher<R.ResponseEntity, APIError> where R: APIRequest {
        session
            .request(request)
            .debug()
            .validate(statusCode: 200 ..< 300)
            .publishDecodable(type: R.ResponseEntity.self)
            .tryMap { response -> R.ResponseEntity in
                response.debug()
                switch response.result {
                case let .success(entity):
                    return entity
                case let .failure(afError):
                    let error: APIError
                    if let code = response.response?.status {
                        error = .http(code)
                    } else {
                        error = .unexpected(afError.underlyingError ?? afError)
                    }
                    throw error
                }
            }
            .mapError { ($0 as? APIError) ?? APIError.unexpected($0) }
            .eraseToAnyPublisher()
    }
}

private extension Alamofire.Request {
    func debug(functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) -> Self {
        #if DEBUG
            cURLDescription { description in print(description) }
        #endif
        return self
    }
}

private extension Alamofire.DataResponse {
    func debug(functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        #if DEBUG
            print(response.debugDescription)
        #endif
    }
}
