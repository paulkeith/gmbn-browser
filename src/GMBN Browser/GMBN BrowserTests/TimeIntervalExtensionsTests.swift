import Foundation
import XCTest

class TimeIntervalExtensionsTests: XCTestCase {
    func testAsMinutes_intervalIsZero_returnsZero() {
        let input: TimeInterval = 0
        let result = input.asMinutes
        
        XCTAssertEqual(0, result)
    }
    
    func testAsMinutes_intervalIsMultipleOfSixty_returnsWholeNumber() {
        let input: TimeInterval = 180
        let result = input.asMinutes
        
        XCTAssertEqual(3, result)
    }
    
    func testAsMinutes_intervalIsLessThanThirtySeconds_returnsZero() {
        let input: TimeInterval = 29
        let result = input.asMinutes
        
        XCTAssertEqual(0, result)
    }
    
    func testAsMinutes_intervalIsMoreThanThirtySeconds_returnsOne() {
        let input: TimeInterval = 31
        let result = input.asMinutes
        
        XCTAssertEqual(1, result)
    }
    
    func testAsMinutes_intervalIsLessThanThirtySecondsPastExactMinute_returnsExactMinuteMinusOne() {
        let input: TimeInterval = 329
        let result = input.asMinutes
        
        XCTAssertEqual(5, result)
    }
    
    func testAsMinutes_intervalIsMoreThanThirtySecondsPastExactMinute_returnsExactMinutePlusOne() {
        let input: TimeInterval = 331
        let result = input.asMinutes
        
        XCTAssertEqual(6, result)
    }
}
