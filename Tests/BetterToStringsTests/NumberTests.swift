    import XCTest
    @testable import BetterToStrings

    final class NumberTests: XCTestCase {
        func testZero() {
            let number = 0
            XCTAssertEqual(number.toString(), "0")
        }
        
        func testRandomNumber() {
            let number = Int.random(in: 0...10000000)
            XCTAssertEqual(number.toString(), "\(number)")
        }
        
        func testNegativeNumber() {
            let number = Int.random(in: -10000000...0)
            XCTAssertEqual(number.toString(), "\(number)")
        }
    }
