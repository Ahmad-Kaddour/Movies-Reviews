//
//  AlamofiraApiProvider.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Alamofire
import Resolver

struct AlamofireApiProvider: ApiProvider {
    private let session: Session

    init(session: Session){
        self.session = session
    }
    
    func proceed<T: Decodable>(request: URLRequestConvertible, ofType type: T.Type) async throws -> T {
        return try await session.request(request).serializingDecodable(T.self).value
    }
}
