import Foundation
import XCTest

class NearestMinuteDurationFormatterTests: XCTestCase {
    func testFormat_inputIsZero_ReturnsZeroMinutes() {
        let input: TimeInterval = 0
        let result = NearestMinuteDurationFormatter().format(input)
        
        XCTAssertEqual("0 minutes", result)
    }
    
    func testFormat_inputIs60Seconds_ReturnsOneMinute() {
        let input: TimeInterval = 60
        let result = NearestMinuteDurationFormatter().format(input)
        
        XCTAssertEqual("1 minute", result)
    }
    
    func testFormat_inputIs120Seconds_ReturnsTwoMinutes() {
        let input: TimeInterval = 120
        let result = NearestMinuteDurationFormatter().format(input)
        
        XCTAssertEqual("2 minutes", result)
    }
}
