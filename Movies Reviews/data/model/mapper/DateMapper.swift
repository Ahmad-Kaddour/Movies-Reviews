//
//  DateMapper.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation

struct DateMapper: Mapper {
    typealias To = String
    typealias From = String
    
    private static let DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss"
    
    func map(_ date: String) -> String {
        return DateUtil.getYear(from: date, withFormat: DateMapper.DATE_FORMAT) ?? ""
    }
}
