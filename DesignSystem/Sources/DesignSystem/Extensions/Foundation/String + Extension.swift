//
//  String + Extension.swift
//  Application
//
//  Created by Ian Baikuchukov on 29/3/24.
//

import Foundation
import NaturalLanguage

extension String {
    func toDate(dateFormat: Date.DateFormat = .yyyy_MM_ddTHHmmssSSSZZZZZ) -> Date? {
        let dateFormat = dateFormat
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let date = dateFormatter.date(from: String(self))
        return date ?? toISO8601Date()
    }
    
    func toISO8601Date() -> Date? {
        ISO8601DateFormatter().date(from: self)
    }
}

extension String {
    func toInt() -> Int? {
        Int(self)
    }
}

extension String {
    
    func withoutLineBreakCharacters() -> String {
        replacingOccurrences(of: "\\n", with: "\n")
    }
    
    /// If `nil` - value is `0`.
    var intValue: Int {
        Int(self) ?? 0
    }
    
    func toURL() -> URL? {
        URL(string: self)
    }
    
}
