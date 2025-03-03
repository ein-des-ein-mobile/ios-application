//
//  Date + Extension.swift
//  Application
//
//  Created by Ian Baikuchukov on 27/3/24.
//

import Foundation

extension TimeZone {
    static var utc: TimeZone {
        TimeZone(identifier: "UTC")!
    }
}

extension Calendar {
    static var utc: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = .utc
        return calendar
    }
}

// MARK: - DateFormat

extension Date {
    
    enum DateFormat: String {
        /// Formatter digit format, e.g. 20.02.2020.
        case ddMMyyyy = "dd.MM.yyyy"
        
        /// Formatter digit format, e.g. 20.02.20.
        case ddMMyy = "dd.MM.yy"
        
        /// Formatter digit format, e.g. 20.02.
        case ddMM = "dd.MM"
        
        /// Formatter digit format, e.g. 20 February 2020.
        case d_MMMM_yyyy = "d MMMM yyyy"
        
        /// Formatter digit format, e.g. 20 Feb, 2020.
        case d_MMM__yyyy = "d MMM, yyyy"
        
        /// Formatter digit format, e.g. 20 Feb 2020.
        case d_MMM_yyyy = "d MMM yyyy"
        
        /// Formatter digit format, e.g. 2020-02-20.
        case YYYY_MM_DD = "yyyy-MM-dd"
        
        /// Formatter digit format, e.g. 2020-02.
        case YYYY_MM = "yyyy-MM"
      
        /// Formatter digit format, e.g. 20:02.
        case hh_MM = "HH:mm"
        
        /// Formatter digit format, e.g. 05 minute.
        case mm = "mm"
        
        /// Formatter digit format, e.g. 05.
        case dd = "dd"

        /// Formatter digit format, e.g. 20:02:49.
        case hh_MM_ss = "HH:mm:ss"
        
        /// Formatter for ISO8601 format e.g. 2020-04-21T07:53:40.343Z
        case yyyy_MM_ddTHHmmssSSSZZZZZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        /// Formatter for ISO8601 format e.g. 2020-04-21T07:53:40Z
        case yyyy_MM_ddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        /// Formatter for ISO8601 format with timezone e.g. 2024-07-25T10:44:32+00:00
        case yyyy_MM_ddTHHmmssZZZZZ = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        /// Formatter digit format, e.g.  ''20:02:49 +4:00.
        case hh_MM_ss_Z = "HH:mm:ss Z"
        
        /// Formatter digit format, e.g.  20:00 AM.
        case h_mm_a = "h:mm a"
        
        /// Formatter digit format, e.g.  2022-02-20 20:00 AM.
        case yyyy_MM_dd__h_mm_a = "yyyy-MM-dd h:mm a"
        
        /// Formatter digit format, e.g.  8 March, 10:00 PM.
        case dd_MMMM__h_mm_a = "dd MMMM, h:mm a"
        
        /// Formatter digit format, e.g. 8 March 2024
        case dd_MMMM_yyyy = "dd MMMM yyyy"
        
        /// Formatter digit format, e.g. March, 2024
        case mmmm_yyyy = "MMMM, yyyy"
        
        /// Formatter digit format, e.g. March 8
        case mmmm_dd = "MMMM dd"
        
        /// Formatter digit format, e.g. "22.04.2024 16:20"
        case dd_MM_yyyy_HH_mm = "dd.MM.yyyy HH:mm"
    }
    
    func toString(dateFormat: DateFormat = .mmmm_dd, timeZone: TimeZone = .current) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
}
