//
//  ServiceModule.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver

extension Resolver {
    static func registerApiServices() {
        register{
            WookieApiService(apiProvider: resolve())
        }.implements(MoviesApiService.self)
    }
}
