//
//  RepositoryModule.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver

extension Resolver {
    static func registerRepositoryServices() {
        register{
            MoviesRepository(moviesService: resolve(), mapper: resolve())
        }.implements(MoviesRepositoryProtocol.self)
    }
}
