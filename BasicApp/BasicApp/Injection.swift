//
//  Injection.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Resolver

extension Resolver: ResolverRegistering {
    static let session = ResolverScopeCache()
    public static func registerAllServices() {
        register { UnsplashRepositoryImpl() as UnsplashRepository }
        registerSessionServices()
    }
    public static func registerSessionServices() {
        register(name: Resolver.Name.unsplash) { APIClientImpl(interceptor: UnsplashServiceInterceptor()) as APIClient }.scope(session)
    }
}
