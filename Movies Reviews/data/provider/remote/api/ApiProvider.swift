//
//  ApiProvider.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation
import Alamofire

protocol ApiProvider {
    func proceed<T: Decodable>(request: URLRequestConvertible, ofType type: T.Type) async throws  -> T
}
