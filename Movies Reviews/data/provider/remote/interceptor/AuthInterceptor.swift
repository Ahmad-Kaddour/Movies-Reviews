//
//  AuthInterceptor.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Alamofire

struct AuthInterceptor: RequestInterceptor {
    private static let ACCESS_TOKEN = "Wookie2019"
    
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization(bearerToken: AuthInterceptor.ACCESS_TOKEN))
        
        completion(.success(urlRequest))
    }
}
