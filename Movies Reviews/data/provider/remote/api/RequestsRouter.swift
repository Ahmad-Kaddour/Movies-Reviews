//
//  URLRequestHelper.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Alamofire


enum RequestsRouter {
    
    case Get(path: String, queryParams: QueryParams? = nil, headers: HTTPHeaders? = nil)
    case Post(path: String, body: Data? = nil, headers: HTTPHeaders? = nil)
    
    var path: String {
        switch self {
        case .Get(let path, _, _):
            return path
        case .Post(let path, _, _):
            return path
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Get:
            return .get
        case .Post:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .Get(_, _, let headers):
            return headers
        case .Post(_, _, let headers):
            return headers
        }
    }
    
}



//MARK: - URLRequestConvertible

extension RequestsRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = RemoteConstants.ApiEndPoints.BASE_URL + path
        
        switch self {
            
        case .Get( _, let queryParams, let headers):
            var request = URLRequest(url: URL(string: url)!)

            if let queryParams = queryParams {
                let finalUrl = queryParams.buildFinalUrl(url: url)
                request = URLRequest(url: finalUrl!)
            }
            request.method = .get
            if let headers = headers {
                request.headers = headers
            }
    
            return request

        case .Post( _, let body, let headers):
            var request = URLRequest(url: try url.asURL())
            request.method = .post
            request.httpBody = body
            if let headers = headers {
                request.headers = headers
            }
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            return request
        }
    }
}
