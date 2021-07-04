import Foundation

public extension Double {
    func toString(abbreviation: AbbreviationStyle = .none,
                  maxSize: Int? = nil,
                  maxFractionDigits: Int? = nil) -> String {
        let formatter = NumberFormatter()
        var number = self
        var magnitude: AbbreviationStyle = abbreviation
        switch abbreviation {
            case .thousand:
                number = number/1000
            case .million:
                number = number/1000000
            case .intelligent:
                if abs(number) >= 1000000 {
                    number = number/1000000
                    magnitude = .million
                } else if abs(number) >= 1000 {
                    number = number/1000
                    magnitude = .thousand
                } else {
                    magnitude = .none
                }
            default:
                break
        }
        
        formatter.maximumFractionDigits = maxFractionDigits ?? number.numOfDecimalDigits()
        
        if let maxSize = maxSize {
            let size = number.numOfIntegerDigits(includeNegativeIndicator: true) + magnitude.symbol.count
            if size > maxSize {
                formatter.maximumFractionDigits = 0
                formatter.maximumIntegerDigits = maxSize
            } else {
                formatter.maximumFractionDigits = maxFractionDigits ?? (maxSize - size)
            }
        }
        return (formatter.string(for: number) ?? "error").appending(magnitude.symbol)
    }
    
    private func numOfIntegerDigits(includeNegativeIndicator minus: Bool = false) -> Int {
        return minus ? String(Int(self)).count : String(abs(Int(self))).count
    }
    
    private func numOfDecimalDigits() -> Int {
        let split = String(self).split(separator: ".")
        if split.count == 2 {
            return split[1].count
        }
        return 0
    }
}

public extension Float {
    func toString(abbreviation: AbbreviationStyle = .none,
                  maxSize: Int? = nil,
                  maxFractionDigits: Int? = nil) -> String {
        return Double(self).toString(abbreviation: abbreviation,
                              maxSize: maxSize,
                              maxFractionDigits: maxFractionDigits)
    }
}

public extension Int {
    func toString(abbreviation: AbbreviationStyle = .none,
                  maxSize: Int? = nil,
                  maxFractionDigits: Int? = nil) -> String {
        return Double(self).toString(abbreviation: abbreviation,
                              maxSize: maxSize,
                              maxFractionDigits: maxFractionDigits)
    }
}

public enum AbbreviationStyle {
    case none, thousand, million, intelligent
    
    var symbol: String {
        switch self {
        case .thousand:
            return "K"
        case .million:
            return "M"
        default:
            return ""
        }
    }
}
