    import XCTest
    @testable import BetterToStrings

    final class DateTests: XCTestCase {
        func test1970() {
            let date = Date(timeIntervalSince1970: 0)
            XCTAssertEqual(date.toString(.date), "1970-01-01")
        }
        
        func testDateFormatter() {
            let date = Date()
            let dateFormat = "YYYY-MM-dd HH:mm:ss Z"
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            XCTAssertEqual(date.toString(format: dateFormat), formatter.string(from: date))
        }
    }
