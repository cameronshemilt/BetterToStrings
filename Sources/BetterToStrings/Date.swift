import SwiftUI

public extension Date {
    func toString(format: String, smartConversion: Bool = false) -> String {
        let df = DateFormatter()
        
        if smartConversion {
            if Calendar.current.isDateInToday(self) {
                return NSLocalizedString("Today", comment: "")
            } else if Calendar.current.isDateInTomorrow(self) {
                return NSLocalizedString("Tomorrow", comment: "")
            } else if Calendar.current.isDateInYesterday(self) {
                return NSLocalizedString("Yesterday", comment: "")
            } else if (self > Date(timeIntervalSinceNow: -86400*6) &&
                        self < Date(timeIntervalSinceNow: 86400*6)) ||
                        Calendar.current.isDate(self, inSameDayAs: Date(timeIntervalSinceNow: -86400*6)) ||
                        Calendar.current.isDate(self, inSameDayAs: Date(timeIntervalSinceNow: 86400*6)) {
                return df.weekdaySymbols[Calendar.current.component(.weekday, from: self) - 1]
            }
        }
        
        df.dateFormat = format
        return df.string(from: self)
    }
    
    func toString(_ dateFormat: DateFormat, smartConversion: Bool = false) -> String {
        return toString(format: dateFormat.rawValue, smartConversion: smartConversion)
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
