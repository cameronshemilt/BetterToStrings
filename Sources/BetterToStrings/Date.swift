import SwiftUI

public extension Date {
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    
    func toString(_ dateFormat: DateFormat) -> String {
        return toString(format: dateFormat.rawValue)
    }
}

public enum DateFormat: String {
    case debug = "YYYY-MM-dd HH:mm:ss Z" // 1970-01-01 00:00:00 +0000
    
    case date = "YYYY-MM-dd" // 1970-01-01
    case europeanDate = "dd.MM.YYYY" // 01.01.1970
    case americanDate = "MM/dd/YYYY" // 01/01/1970
    case spelledDate = "dd. MMMM YYYY" // 01. January 1970
    case spelledDateShort = "dd. MMM. YYYY" // 01. Jan. 1970
    case time = "HH:mm:ss" // 00:00:00
    case meridiemTime = "hh:mm:ss a" // 00:00:00 AM
    case timeZone = "Z (zzzz)" // +0000 (Greenwich Mean Time)
}

// An exact guide for creating your own formats can be found here:
// https://www.datetimeformatter.com/how-to-format-date-time-in-swift#patterns
