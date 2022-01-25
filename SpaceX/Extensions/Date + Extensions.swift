//
//  Date + Extensions.swift
//  SpaceX
//
//  
//

import Foundation

extension Date {
    func getDateStringInDisplayFormat(utcString: String, format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: utcString) {
            let compactDateFormatter = DateFormatter()
            compactDateFormatter.locale = Locale.current
            compactDateFormatter.dateFormat = DateFormats.displayDateFormat
            return compactDateFormatter.string(from: date)
        }
        return nil
    }
}
