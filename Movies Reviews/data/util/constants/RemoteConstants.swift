//
//  RemoteConstants.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

struct RemoteConstants {
    
    struct ApiEndPoints{
        static let BASE_URL = "https://wookie.codesubmit.io/";

        static let MOVIES_PATH = "movies"
    }
    
    struct Headers{
        static let TOKEN_HEADER = "Authorization";
        static let LANGUAGE_HEADER = "lang";
    }
}
