//
//  DateUtil.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation

struct DateUtil{
    
    static func getDate(from dateStr: String, withFormat format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateStr)
    }
    
    static func getYear(from dateStr: String, withFormat format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        formatter.locale = Locale(identifier: "en_US")
        guard let date = getDate(from: dateStr, withFormat: format) else { return nil }
        return formatter.string(from: date)
    }
    
}
