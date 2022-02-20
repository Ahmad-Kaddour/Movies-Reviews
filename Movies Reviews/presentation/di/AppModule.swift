//
//  NetworkModule.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver
import Alamofire


extension Resolver {
    static func registerApplicationServices() {
        register{
            Session(interceptor: AuthInterceptor(), eventMonitors: [Logger()])
        }.scope(.application)
        
        register{
            AlamofireApiProvider(session: resolve())
        }
        .implements(ApiProvider.self)
        .scope(.application)
        
        registerMappers()
    }
    
    private static func registerMappers(){
        register{
            DateMapper()
        }.scope(.application)
        
        register{
            MovieDataMapper(dateMapper: resolve())
        }.scope(.application)
    }
}
