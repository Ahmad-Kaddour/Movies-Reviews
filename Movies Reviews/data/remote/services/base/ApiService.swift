//
//  ApiService.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Alamofire
import Resolver

class ApiService {
    let apiProvider: ApiProvider
    
    init(apiProvider: ApiProvider){
        self.apiProvider = apiProvider
    }
}
