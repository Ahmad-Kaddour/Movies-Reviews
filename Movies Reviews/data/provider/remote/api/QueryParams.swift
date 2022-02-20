//
//  QueryParams.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

class QueryParams {
    
    private var queryItems  = [URLQueryItem]()
    
    func addQuery(key: String, value: String) -> QueryParams {
        queryItems.append(URLQueryItem(name: key, value: value))
        return self
    }
    
    func addQuery(key: String, value: Int) -> QueryParams {
        return addQuery(key: key, value: String(value))
    }
    
    func buildFinalUrl(url: String) -> URL? {
        return addQueryPramsToUrl(url: url, queryPrams: queryItems)
    }
    
    func addQueryPramsToUrl(url urlString: String, queryPrams: [URLQueryItem]) -> URL? {
        var urlComps = URLComponents(string: urlString)
        urlComps?.queryItems = queryItems
        return urlComps?.url
    }
}
