//
//  DateFormatter.swift
//  Core
//
//  Created by Anton Bal` on 02.10.2022.
//

import Foundation
import Core

extension DateFormatter {
    public static var shortDateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }
}
