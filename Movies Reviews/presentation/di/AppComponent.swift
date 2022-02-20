//
//  AppModule.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerApplicationServices()
        registerApiServices()
        registerRepositoryServices()
        registerRepositoryServices()
        registerViewModelServices()
    }
}
